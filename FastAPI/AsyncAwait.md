# **Async/Await**

## Qu'est-ce que Async/Await ?

**Async/Await** est un système de **programmation asynchrone** qui permet d'écrire du code qui ne bloque pas l'exécution pendant les opérations lentes (I/O, réseau, base de données).

### Analogie simple
```
Code synchrone (bloquant) :
Person 1: "Je commande un café" → attend 5 minutes → reçoit le café
Person 2: "Je veux aussi un café" → attend que Person 1 soit servie → attend 5 minutes

Code asynchrone (non-bloquant) :
Person 1: "Je commande un café" → va s'asseoir
Person 2: "Je commande un café" → va s'asseoir  
Barista: Prépare les deux cafés en parallèle
```

---

## **Concepts de base**

### Programmation synchrone vs asynchrone
```python
import time
import asyncio

# SYNCHRONE (bloquant)
def sync_task():
    print("Début tâche sync")
    time.sleep(2)  # BLOQUE tout le programme pendant 2 secondes
    print("Fin tâche sync")
    return "Résultat sync"

def run_sync():
    print("=== SYNCHRONE ===")
    result1 = sync_task()  # Attend 2 secondes
    result2 = sync_task()  # Attend encore 2 secondes
    print(f"Total: 4 secondes pour {result1} et {result2}")

# ASYNCHRONE (non-bloquant)
async def async_task():
    print("Début tâche async")
    await asyncio.sleep(2)  # N'BLOQUE PAS, libère le contrôle
    print("Fin tâche async")
    return "Résultat async"

async def run_async():
    print("=== ASYNCHRONE ===")
    # Les deux tâches s'exécutent en parallèle !
    result1, result2 = await asyncio.gather(
        async_task(),
        async_task()
    )
    print(f"Total: 2 secondes pour {result1} et {result2}")

# Exécution
if __name__ == "__main__":
    run_sync()  # Prend 4 secondes
    asyncio.run(run_async())  # Prend 2 secondes !
```

---

## **FastAPI avec Async/Await**

### Routes synchrones vs asynchrones
```python
from fastapi import FastAPI
import time
import asyncio
import httpx

app = FastAPI()

# Route SYNCHRONE (bloque le serveur)
@app.get("/sync-slow")
def sync_slow_endpoint():
    """Cette route bloque tout le serveur pendant 3 secondes"""
    print("Début traitement sync...")
    time.sleep(3)  # Simulation d'une opération lente
    print("Fin traitement sync")
    return {"message": "Traitement sync terminé"}

# Route ASYNCHRONE (ne bloque pas le serveur)
@app.get("/async-slow")
async def async_slow_endpoint():
    """Cette route ne bloque pas le serveur"""
    print("Début traitement async...")
    await asyncio.sleep(3)  # Autres requêtes peuvent être traitées !
    print("Fin traitement async")
    return {"message": "Traitement async terminé"}

# Comparaison pratique
@app.get("/sync-multiple")
def sync_multiple():
    """Traite 3 opérations séquentiellement"""
    results = []
    for i in range(3):
        time.sleep(1)  # 1 seconde chacune
        results.append(f"Tâche {i+1} terminée")
    return {"results": results, "duration": "3 secondes"}

@app.get("/async-multiple")
async def async_multiple():
    """Traite 3 opérations en parallèle"""
    async def task(num):
        await asyncio.sleep(1)
        return f"Tâche {num} terminée"
    
    # Exécution en parallèle
    results = await asyncio.gather(
        task(1), task(2), task(3)
    )
    return {"results": results, "duration": "1 seconde"}
```

---

## **Appels vers des APIs externes**

### Avec httpx (client HTTP asynchrone)
```python
import httpx
from typing import List

# MAUVAIS : Client synchrone dans route async
@app.get("/bad-external-calls")
async def bad_external_calls():
    import requests  # Client synchrone
    
    # Même dans une fonction async, requests bloque !
    response = requests.get("https://httpbin.org/delay/2")
    return response.json()

# BON : Client asynchrone
@app.get("/good-external-calls")
async def good_external_calls():
    async with httpx.AsyncClient() as client:
        response = await client.get("https://httpbin.org/delay/2")
        return response.json()

# EXCELLENT : Appels multiples en parallèle
@app.get("/parallel-external-calls")
async def parallel_external_calls():
    urls = [
        "https://httpbin.org/delay/1",
        "https://httpbin.org/delay/1", 
        "https://httpbin.org/delay/1"
    ]
    
    async with httpx.AsyncClient() as client:
        # Tous les appels en parallèle !
        tasks = [client.get(url) for url in urls]
        responses = await asyncio.gather(*tasks)
        
        return {
            "results": [r.json() for r in responses],
            "total_time": "~1 seconde au lieu de 3"
        }

# Gestion d'erreurs avec appels parallèles
@app.get("/safe-parallel-calls")
async def safe_parallel_calls():
    async def safe_call(client, url):
        try:
            response = await client.get(url, timeout=5.0)
            return {"url": url, "status": "success", "data": response.json()}
        except httpx.TimeoutException:
            return {"url": url, "status": "timeout", "data": None}
        except httpx.RequestError as e:
            return {"url": url, "status": "error", "data": str(e)}
    
    urls = [
        "https://httpbin.org/delay/1",
        "https://httpbin.org/status/500",  # Erreur
        "https://httpbin.org/delay/10",    # Timeout
    ]
    
    async with httpx.AsyncClient() as client:
        results = await asyncio.gather(
            *[safe_call(client, url) for url in urls]
        )
        
    return {"results": results}
```

---

## **Base de données asynchrone**

### Avec databases (SQLAlchemy async)
```python
from databases import Database
import sqlalchemy

# Configuration base de données async
DATABASE_URL = "sqlite:///./test.db"
database = Database(DATABASE_URL)

metadata = sqlalchemy.MetaData()
users_table = sqlalchemy.Table(
    "users",
    metadata,
    sqlalchemy.Column("id", sqlalchemy.Integer, primary_key=True),
    sqlalchemy.Column("name", sqlalchemy.String),
    sqlalchemy.Column("email", sqlalchemy.String),
)

# Connexion/déconnexion
@app.on_event("startup")
async def startup():
    await database.connect()

@app.on_event("shutdown")
async def shutdown():
    await database.disconnect()

# Routes avec base de données async
@app.get("/users/")
async def get_users():
    query = users_table.select()
    users = await database.fetch_all(query)
    return [{"id": user.id, "name": user.name, "email": user.email} for user in users]

@app.post("/users/")
async def create_user(name: str, email: str):
    query = users_table.insert().values(name=name, email=email)
    user_id = await database.execute(query)
    return {"id": user_id, "name": name, "email": email}

# Requêtes multiples en parallèle
@app.get("/users/{user_id}/complete-profile")
async def get_complete_profile(user_id: int):
    # Plusieurs requêtes en parallèle
    user_query = users_table.select().where(users_table.c.id == user_id)
    posts_query = "SELECT * FROM posts WHERE user_id = :user_id"
    followers_query = "SELECT COUNT(*) FROM followers WHERE followed_id = :user_id"
    
    user, posts, follower_count = await asyncio.gather(
        database.fetch_one(user_query),
        database.fetch_all(posts_query, {"user_id": user_id}),
        database.fetch_val(followers_query, {"user_id": user_id})
    )
    
    return {
        "user": dict(user),
        "posts": [dict(post) for post in posts],
        "followers": follower_count
    }
```

---

## **Upload et traitement de fichiers**

```python
from fastapi import UploadFile, File
import aiofiles
import os

@app.post("/upload-sync/")
def upload_file_sync(file: UploadFile = File(...)):
    """Upload synchrone - bloque le serveur"""
    content = file.file.read()  # Bloque si fichier volumineux
    
    with open(f"uploads/{file.filename}", "wb") as f:
        f.write(content)  # Bloque aussi
    
    return {"filename": file.filename, "size": len(content)}

@app.post("/upload-async/")
async def upload_file_async(file: UploadFile = File(...)):
    """Upload asynchrone - ne bloque pas le serveur"""
    
    # Lecture asynchrone
    content = await file.read()
    
    # Écriture asynchrone
    async with aiofiles.open(f"uploads/{file.filename}", "wb") as f:
        await f.write(content)
    
    return {"filename": file.filename, "size": len(content)}

# Traitement de multiple fichiers
@app.post("/upload-multiple/")
async def upload_multiple_files(files: List[UploadFile] = File(...)):
    """Upload de plusieurs fichiers en parallèle"""
    
    async def save_file(file: UploadFile):
        content = await file.read()
        async with aiofiles.open(f"uploads/{file.filename}", "wb") as f:
            await f.write(content)
        return {"filename": file.filename, "size": len(content)}
    
    # Sauvegarde en parallèle
    results = await asyncio.gather(*[save_file(file) for file in files])
    return {"files": results}
```

---

## **WebSockets asynchrones**

```python
from fastapi import WebSocket, WebSocketDisconnect
from typing import List

# Gestionnaire de connexions WebSocket
class ConnectionManager:
    def __init__(self):
        self.active_connections: List[WebSocket] = []
    
    async def connect(self, websocket: WebSocket):
        await websocket.accept()
        self.active_connections.append(websocket)
    
    def disconnect(self, websocket: WebSocket):
        self.active_connections.remove(websocket)
    
    async def send_personal_message(self, message: str, websocket: WebSocket):
        await websocket.send_text(message)
    
    async def broadcast(self, message: str):
        # Envoi en parallèle à tous les clients
        await asyncio.gather(
            *[ws.send_text(message) for ws in self.active_connections]
        )

manager = ConnectionManager()

@app.websocket("/ws/{client_id}")
async def websocket_endpoint(websocket: WebSocket, client_id: int):
    await manager.connect(websocket)
    try:
        while True:
            # Réception asynchrone
            data = await websocket.receive_text()
            
            # Traitement asynchrone (ex: appel API, BDD)
            processed_data = await process_message(data)
            
            # Diffusion asynchrone
            await manager.broadcast(f"Client {client_id}: {processed_data}")
            
    except WebSocketDisconnect:
        manager.disconnect(websocket)
        await manager.broadcast(f"Client {client_id} left the chat")

async def process_message(message: str) -> str:
    # Simulation de traitement async (API, IA, etc.)
    await asyncio.sleep(0.1)
    return message.upper()
```

---

## **Gestion des tâches de background**

```python
from fastapi import BackgroundTasks
import smtplib
from email.mime.text import MIMEText

# Tâche synchrone en arrière-plan
def send_email_sync(email: str, message: str):
    """Tâche lente exécutée en arrière-plan"""
    time.sleep(2)  # Simulation envoi email
    print(f"Email envoyé à {email}: {message}")

@app.post("/send-notification/")
def send_notification(email: str, background_tasks: BackgroundTasks):
    # La réponse est renvoyée immédiatement
    background_tasks.add_task(send_email_sync, email, "Bienvenue !")
    return {"message": "Notification en cours d'envoi"}

# Tâche asynchrone en arrière-plan
async def send_email_async(email: str, message: str):
    """Tâche async en arrière-plan"""
    await asyncio.sleep(2)  # Simulation envoi async
    print(f"Email async envoyé à {email}: {message}")

@app.post("/send-notification-async/")
async def send_notification_async(email: str, background_tasks: BackgroundTasks):
    # Tâche async en arrière-plan
    background_tasks.add_task(send_email_async, email, "Bienvenue async !")
    return {"message": "Notification async en cours d'envoi"}

# Tâches multiples en arrière-plan
@app.post("/register-user/")
async def register_user(email: str, background_tasks: BackgroundTasks):
    # Plusieurs tâches en parallèle
    background_tasks.add_task(send_email_async, email, "Bienvenue !")
    background_tasks.add_task(create_user_profile, email)
    background_tasks.add_task(add_to_mailing_list, email)
    
    return {"message": "Inscription réussie, traitements en cours"}

async def create_user_profile(email: str):
    await asyncio.sleep(1)
    print(f"Profil créé pour {email}")

async def add_to_mailing_list(email: str):
    await asyncio.sleep(0.5)
    print(f"{email} ajouté à la mailing list")
```

---

## **Patterns avancés**

### Retry et timeout
```python
import asyncio
from functools import wraps

def async_retry(max_attempts: int = 3, delay: float = 1.0):
    """Decorator pour retry automatique"""
    def decorator(func):
        @wraps(func)
        async def wrapper(*args, **kwargs):
            last_exception = None
            
            for attempt in range(max_attempts):
                try:
                    return await func(*args, **kwargs)
                except Exception as e:
                    last_exception = e
                    if attempt < max_attempts - 1:
                        await asyncio.sleep(delay * (attempt + 1))
                    
            raise last_exception
        return wrapper
    return decorator

@async_retry(max_attempts=3, delay=1.0)
async def unreliable_api_call():
    async with httpx.AsyncClient() as client:
        response = await client.get("https://httpbin.org/status/500")
        response.raise_for_status()
        return response.json()

# Timeout avec asyncio
@app.get("/with-timeout/")
async def endpoint_with_timeout():
    try:
        # Timeout de 5 secondes
        result = await asyncio.wait_for(
            slow_operation(),
            timeout=5.0
        )
        return {"result": result}
    except asyncio.TimeoutError:
        return {"error": "Opération trop lente", "timeout": "5s"}

async def slow_operation():
    await asyncio.sleep(10)  # Plus lent que le timeout
    return "Terminé"
```

### Semaphore et limitation de concurrence
```python
# Limitation du nombre d'opérations simultanées
semaphore = asyncio.Semaphore(3)  # Max 3 opérations en parallèle

async def limited_operation(data):
    async with semaphore:
        # Seulement 3 instances de cette fonction en même temps
        await asyncio.sleep(1)
        return f"Processed: {data}"

@app.post("/batch-process/")
async def batch_process(items: List[str]):
    # Même avec 100 items, max 3 en parallèle
    results = await asyncio.gather(
        *[limited_operation(item) for item in items]
    )
    return {"results": results}
```

### Context managers asynchrones
```python
from contextlib import asynccontextmanager

@asynccontextmanager
async def database_transaction():
    """Context manager pour transactions async"""
    transaction = await database.transaction()
    try:
        yield transaction
        await transaction.commit()
    except Exception:
        await transaction.rollback()
        raise
    finally:
        await transaction.close()

@app.post("/transfer-money/")
async def transfer_money(from_user: int, to_user: int, amount: float):
    async with database_transaction():
        # Toutes ces opérations dans une transaction
        await database.execute(
            "UPDATE accounts SET balance = balance - :amount WHERE user_id = :user_id",
            {"amount": amount, "user_id": from_user}
        )
        await database.execute(
            "UPDATE accounts SET balance = balance + :amount WHERE user_id = :user_id", 
            {"amount": amount, "user_id": to_user}
        )
        
    return {"message": f"Transfert de {amount}€ effectué"}
```

---

## **Debugging et monitoring**

### Logging asynchrone
```python
import logging
import asyncio

# Configuration logging async
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

async def log_async_operation(operation_name: str, duration: float):
    """Log asynchrone pour ne pas bloquer"""
    await asyncio.sleep(0)  # Yield control
    logger.info(f"{operation_name} completed in {duration:.2f}s")

@app.get("/monitored-endpoint/")
async def monitored_endpoint():
    start_time = asyncio.get_event_loop().time()
    
    # Opération principale
    await asyncio.sleep(1)
    result = {"data": "some result"}
    
    # Log asynchrone
    duration = asyncio.get_event_loop().time() - start_time
    asyncio.create_task(log_async_operation("monitored_endpoint", duration))
    
    return result
```

### Mesure de performance
```python
import time
from functools import wraps

def measure_async_time(func):
    """Decorator pour mesurer le temps d'exécution async"""
    @wraps(func)
    async def wrapper(*args, **kwargs):
        start = time.time()
        try:
            result = await func(*args, **kwargs)
            return result
        finally:
            duration = time.time() - start
            logger.info(f"{func.__name__} took {duration:.3f} seconds")
    return wrapper

@app.get("/measured/")
@measure_async_time
async def measured_endpoint():
    await asyncio.sleep(0.5)
    return {"message": "Measured operation"}
```

---

## **Bonnes pratiques**

### Quand utiliser async/await
```python
# ✅ BON : I/O operations
@app.get("/good-async-usage/")
async def good_async_usage():
    # Appels réseau
    async with httpx.AsyncClient() as client:
        response = await client.get("https://api.example.com")
    
    # Base de données
    users = await database.fetch_all("SELECT * FROM users")
    
    # Fichiers
    async with aiofiles.open("data.txt") as f:
        content = await f.read()
    
    return {"response": response.json(), "users": len(users)}

# ❌ MAUVAIS : CPU-intensive tasks
@app.get("/bad-async-usage/")
async def bad_async_usage():
    # Pas d'I/O, juste du CPU - inutile d'être async
    result = sum(i * i for i in range(1000000))
    return {"result": result}

# ✅ BON : Pour CPU-intensive, utiliser des threads
from concurrent.futures import ThreadPoolExecutor
import asyncio

executor = ThreadPoolExecutor()

def cpu_intensive_task():
    return sum(i * i for i in range(1000000))

@app.get("/cpu-intensive-async/")
async def cpu_intensive_async():
    # Exécute dans un thread séparé
    result = await asyncio.get_event_loop().run_in_executor(
        executor, cpu_intensive_task
    )
    return {"result": result}
```

### Gestion d'erreurs asynchrone
```python
@app.get("/error-handling/")
async def error_handling_example():
    tasks = []
    
    # Créer plusieurs tâches
    for i in range(5):
        tasks.append(risky_async_operation(i))
    
    # Attendre toutes les tâches même si certaines échouent
    results = await asyncio.gather(*tasks, return_exceptions=True)
    
    successes = []
    errors = []
    
    for i, result in enumerate(results):
        if isinstance(result, Exception):
            errors.append({"task": i, "error": str(result)})
        else:
            successes.append({"task": i, "result": result})
    
    return {
        "successes": successes,
        "errors": errors,
        "total_tasks": len(tasks)
    }

async def risky_async_operation(task_id: int):
    await asyncio.sleep(0.1)
    if task_id == 2:  # Simulation d'erreur
        raise ValueError(f"Task {task_id} failed")
    return f"Task {task_id} completed"
```

---

## **Comparaison des performances**

```python
import time

# Test de performance : sync vs async
@app.get("/perf-test-sync/")
def perf_test_sync():
    """Test avec 5 opérations synchrones"""
    start = time.time()
    results = []
    
    for i in range(5):
        time.sleep(0.5)  # Simulation I/O bloquant
        results.append(f"Task {i} done")
    
    duration = time.time() - start
    return {
        "results": results,
        "duration": f"{duration:.2f}s",  # ~2.5 secondes
        "type": "synchronous"
    }

@app.get("/perf-test-async/")
async def perf_test_async():
    """Test avec 5 opérations asynchrones"""
    start = time.time()
    
    async def async_task(task_id):
        await asyncio.sleep(0.5)  # I/O non-bloquant
        return f"Task {task_id} done"
    
    # Exécution en parallèle
    results = await asyncio.gather(*[async_task(i) for i in range(5)])
    
    duration = time.time() - start
    return {
        "results": results,
        "duration": f"{duration:.2f}s",  # ~0.5 secondes !
        "type": "asynchronous"
    }
```

### Résumé des avantages

**Avec async/await :**
- ✅ Meilleure utilisation des ressources
- ✅ Plus de requêtes simultanées
- ✅ Réactivité améliorée
- ✅ Idéal pour I/O (réseau, fichiers, BDD)

**Attention :**
- ❌ Plus complexe à déboguer
- ❌ Tous les composants doivent être async
- ❌ Pas utile pour calculs CPU intensifs
- ❌ Courbe d'apprentissage plus élevée