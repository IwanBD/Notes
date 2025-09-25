# **Méthodes HTTP**

## Qu'est-ce que les méthodes HTTP ?

Les méthodes HTTP définissent l'**action à effectuer** sur une ressource. Elles indiquent au serveur ce que le client veut faire : lire, créer, modifier ou supprimer des données.

```
Client ────[METHOD + URL + DATA]────> Serveur
       <───[STATUS + RESPONSE]──────
```

---

## **GET** - Récupérer des données

### Principe
**GET** sert à **lire/récupérer** des données. C'est la méthode la plus utilisée.

### Caractéristiques
- **Sûre** : Ne modifie pas les données sur le serveur
- **Idempotente** : Peut être appelée plusieurs fois sans effet de bord
- **Cacheable** : Les réponses peuvent être mises en cache
- **Pas de body** : Les paramètres sont dans l'URL

### Exemples avec FastAPI
```python
from fastapi import FastAPI, Query
from typing import Optional, List

app = FastAPI()

# GET simple
@app.get("/")
def read_root():
    return {"message": "Hello World"}

# GET avec paramètre de chemin
@app.get("/users/{user_id}")
def get_user(user_id: int):
    return {"user_id": user_id, "name": "John Doe"}

# GET avec paramètres de requête
@app.get("/items/")
def get_items(skip: int = 0, limit: int = 10, search: Optional[str] = None):
    return {
        "items": [f"item_{i}" for i in range(skip, skip + limit)],
        "search": search,
        "total": limit
    }

# GET avec validation de paramètres
@app.get("/products/")
def get_products(
    category: str = Query(..., description="Product category"),
    min_price: float = Query(0, ge=0, description="Minimum price"),
    max_price: float = Query(1000, le=10000, description="Maximum price"),
    tags: List[str] = Query([], description="Product tags")
):
    return {
        "category": category,
        "price_range": {"min": min_price, "max": max_price},
        "tags": tags
    }
```

### Exemples d'URLs GET
```
GET /users                    # Tous les utilisateurs
GET /users/123               # Utilisateur avec ID 123
GET /users?active=true       # Utilisateurs actifs
GET /products?category=books&min_price=10&max_price=50
```

---

## **POST** - Créer des données

### Principe
**POST** sert à **créer** de nouvelles ressources sur le serveur.

### Caractéristiques
- **Non sûre** : Modifie l'état du serveur
- **Non idempotente** : Multiples appels créent plusieurs ressources
- **Avec body** : Les données sont dans le corps de la requête
- **Non cacheable** : Les réponses ne sont pas mises en cache

### Exemples avec FastAPI
```python
from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class User(BaseModel):
    name: str
    email: str
    age: Optional[int] = None

class UserResponse(BaseModel):
    id: int
    name: str
    email: str
    age: Optional[int] = None
    created_at: datetime

# POST simple
@app.post("/users/", response_model=UserResponse)
def create_user(user: User):
    # Simulation création en base
    new_user = UserResponse(
        id=123,
        name=user.name,
        email=user.email,
        age=user.age,
        created_at=datetime.now()
    )
    return new_user

# POST avec validation avancée
from pydantic import validator

class Product(BaseModel):
    name: str
    price: float
    description: Optional[str] = None
    category: str
    
    @validator('price')
    def price_must_be_positive(cls, v):
        if v <= 0:
            raise ValueError('Price must be positive')
        return v

@app.post("/products/")
def create_product(product: Product):
    return {
        "message": f"Product '{product.name}' created successfully",
        "product": product
    }

# POST avec upload de fichier
from fastapi import File, UploadFile

@app.post("/upload/")
async def upload_file(file: UploadFile = File(...)):
    return {
        "filename": file.filename,
        "content_type": file.content_type,
        "size": file.size
    }

# POST avec formulaire
from fastapi import Form

@app.post("/login/")
async def login(username: str = Form(...), password: str = Form(...)):
    return {"username": username, "message": "Login attempt recorded"}
```

---

## **PUT** - Remplacer/Mettre à jour complètement

### Principe
**PUT** sert à **remplacer complètement** une ressource ou la créer si elle n'existe pas.

### Caractéristiques
- **Non sûre** : Modifie l'état du serveur
- **Idempotente** : Multiples appels ont le même effet
- **Avec body** : Les données complètes sont dans le corps
- **Remplace tout** : Remplace la ressource entière

### Exemples avec FastAPI
```python
class UserUpdate(BaseModel):
    name: str
    email: str
    age: int
    is_active: bool

# PUT - Remplacer complètement
@app.put("/users/{user_id}")
def update_user(user_id: int, user: UserUpdate):
    # Remplace TOUTES les données de l'utilisateur
    return {
        "user_id": user_id,
        "message": "User completely updated",
        "user": user
    }

# PUT avec création si n'existe pas
@app.put("/users/{user_id}/profile")
def upsert_profile(user_id: int, profile: dict):
    # Crée le profil s'il n'existe pas, sinon le remplace
    return {
        "user_id": user_id,
        "profile": profile,
        "action": "created_or_replaced"
    }
```

---

## **PATCH** - Modification partielle

### Principe
**PATCH** sert à **modifier partiellement** une ressource existante.

### Caractéristiques
- **Non sûre** : Modifie l'état du serveur
- **Peut être idempotente** : Dépend de l'implémentation
- **Avec body** : Contient seulement les champs à modifier
- **Modification partielle** : Ne touche que les champs fournis

### Exemples avec FastAPI
```python
class UserPatch(BaseModel):
    name: Optional[str] = None
    email: Optional[str] = None
    age: Optional[int] = None
    is_active: Optional[bool] = None

# PATCH - Modification partielle
@app.patch("/users/{user_id}")
def patch_user(user_id: int, user_updates: UserPatch):
    # Ne modifie que les champs fournis
    updates = user_updates.dict(exclude_unset=True)  # Exclut les None
    return {
        "user_id": user_id,
        "message": f"Updated fields: {list(updates.keys())}",
        "updates": updates
    }

# PATCH avec logique complexe
@app.patch("/posts/{post_id}/status")
def update_post_status(post_id: int, status: str):
    valid_statuses = ["draft", "published", "archived"]
    if status not in valid_statuses:
        raise HTTPException(400, f"Status must be one of: {valid_statuses}")
    
    return {
        "post_id": post_id,
        "new_status": status,
        "updated_at": datetime.now()
    }
```

---

## **DELETE** - Supprimer des données

### Principe
**DELETE** sert à **supprimer** des ressources du serveur.

### Caractéristiques
- **Non sûre** : Modifie l'état du serveur
- **Idempotente** : Supprimer plusieurs fois = même résultat
- **Généralement sans body** : L'ID est dans l'URL
- **Réponse souvent vide** : Status 204 No Content

### Exemples avec FastAPI
```python
from fastapi import HTTPException

# DELETE simple
@app.delete("/users/{user_id}")
def delete_user(user_id: int):
    # Simulation suppression
    if user_id == 999:  # User introuvable
        raise HTTPException(status_code=404, detail="User not found")
    
    return {"message": f"User {user_id} deleted successfully"}

# DELETE avec status 204
@app.delete("/users/{user_id}", status_code=204)
def delete_user_no_content(user_id: int):
    # Suppression sans réponse (status 204)
    pass

# DELETE conditionnel
@app.delete("/posts/{post_id}")
def delete_post(post_id: int, force: bool = False):
    if not force:
        # Vérifier si le post peut être supprimé
        return {
            "message": "Post has comments. Use force=true to delete anyway.",
            "post_id": post_id
        }
    
    return {"message": f"Post {post_id} force deleted"}

# DELETE en masse
from typing import List

@app.delete("/users/")
def delete_users(user_ids: List[int]):
    return {
        "message": f"Deleted {len(user_ids)} users",
        "deleted_ids": user_ids
    }
```

---

## **HEAD** - Métadonnées seulement

### Principe
**HEAD** est identique à GET mais renvoie **seulement les headers**, pas le body.

### Exemples avec FastAPI
```python
@app.head("/users/{user_id}")
def head_user(user_id: int):
    # FastAPI gère automatiquement HEAD pour les routes GET
    return {"user_id": user_id}  # Le body ne sera pas renvoyé

# HEAD personnalisé
from fastapi import Response

@app.head("/files/{filename}")
def check_file_exists(filename: str, response: Response):
    if filename == "missing.txt":
        response.status_code = 404
    else:
        response.headers["Content-Length"] = "1024"
        response.headers["Content-Type"] = "text/plain"
    return None
```

---

## **OPTIONS** - Méthodes autorisées

### Principe
**OPTIONS** retourne les méthodes HTTP autorisées pour une ressource.

### Exemples avec FastAPI
```python
# FastAPI gère automatiquement OPTIONS
@app.options("/users/{user_id}")
def options_user(user_id: int):
    return {
        "allowed_methods": ["GET", "POST", "PUT", "PATCH", "DELETE"],
        "description": "User resource endpoints"
    }
```

---

## **Codes de statut HTTP par méthode**

### GET
```python
@app.get("/users/{user_id}")
def get_user(user_id: int):
    if user_id == 404:
        raise HTTPException(status_code=404, detail="User not found")
    return {"user_id": user_id}  # 200 OK
```

### POST
```python
from fastapi import status

@app.post("/users/", status_code=status.HTTP_201_CREATED)
def create_user(user: User):
    return {"message": "User created"}  # 201 Created

@app.post("/users/validate")
def validate_user(user: User):
    if user.email == "invalid":
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Invalid email"
        )
    return {"valid": True}  # 200 OK
```

### PUT
```python
@app.put("/users/{user_id}")
def update_user(user_id: int, user: User):
    if user_id == 999:  # Création
        return {"message": "User created", "user": user}  # 201 Created
    else:  # Mise à jour
        return {"message": "User updated", "user": user}  # 200 OK
```

### DELETE
```python
@app.delete("/users/{user_id}", status_code=204)
def delete_user(user_id: int):
    if user_id == 404:
        raise HTTPException(status_code=404, detail="User not found")
    # 204 No Content (pas de body)
```

---

## **Idempotence et sécurité**

| Méthode | Sûre | Idempotente | Description |
|---------|------|-------------|-------------|
| GET     | ✅   | ✅          | Lecture seule |
| HEAD    | ✅   | ✅          | Comme GET sans body |
| OPTIONS | ✅   | ✅          | Informations sur la ressource |
| POST    | ❌   | ❌          | Crée à chaque fois |
| PUT     | ❌   | ✅          | Même résultat si répété |
| PATCH   | ❌   | ⚠️          | Dépend de l'implémentation |
| DELETE  | ❌   | ✅          | Supprimer déjà supprimé = OK |

---

## **Bonnes pratiques REST**

### Convention des URLs
```python
# Collection vs Ressource
@app.get("/users")          # GET collection
@app.post("/users")         # POST sur collection (créer)
@app.get("/users/{id}")     # GET ressource spécifique
@app.put("/users/{id}")     # PUT ressource (remplacer)
@app.patch("/users/{id}")   # PATCH ressource (modifier)
@app.delete("/users/{id}")  # DELETE ressource

# Ressources imbriquées
@app.get("/users/{user_id}/posts")           # Posts d'un utilisateur
@app.post("/users/{user_id}/posts")          # Créer un post pour un utilisateur
@app.get("/users/{user_id}/posts/{post_id}") # Post spécifique d'un utilisateur
```

### Gestion des erreurs cohérente
```python
from fastapi import HTTPException, status

class HTTPError(BaseModel):
    detail: str
    code: Optional[str] = None

@app.exception_handler(404)
async def not_found_handler(request, exc):
    return JSONResponse(
        status_code=404,
        content={"detail": "Resource not found", "code": "NOT_FOUND"}
    )

@app.get("/users/{user_id}")
def get_user(user_id: int):
    if user_id not in users_db:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"User {user_id} not found"
        )
    return users_db[user_id]
```

### Headers utiles
```python
from fastapi import Response

@app.post("/users/")
def create_user(user: User, response: Response):
    new_user = create_user_in_db(user)
    
    # Header Location pour ressource créée
    response.headers["Location"] = f"/users/{new_user.id}"
    response.status_code = 201
    
    return new_user

@app.get("/users/")
def get_users(response: Response):
    users = get_all_users()
    
    # Headers de cache
    response.headers["Cache-Control"] = "public, max-age=300"  # 5 minutes
    response.headers["ETag"] = generate_etag(users)
    
    return users
```

---

## **Exemples complets d'API REST**

```python
from fastapi import FastAPI, HTTPException, status, Response
from pydantic import BaseModel
from typing import List, Optional
from datetime import datetime

app = FastAPI(title="Blog API", version="1.0.0")

# Models
class PostBase(BaseModel):
    title: str
    content: str
    published: bool = False

class PostCreate(PostBase):
    pass

class PostUpdate(BaseModel):
    title: Optional[str] = None
    content: Optional[str] = None
    published: Optional[bool] = None

class Post(PostBase):
    id: int
    created_at: datetime
    updated_at: datetime

# Base de données fictive
posts_db = {}
post_id_counter = 1

# CRUD complet pour les posts
@app.get("/posts/", response_model=List[Post])
def get_posts(skip: int = 0, limit: int = 10, published_only: bool = False):
    """Récupérer tous les posts avec pagination"""
    posts = list(posts_db.values())
    
    if published_only:
        posts = [p for p in posts if p.published]
    
    return posts[skip:skip + limit]

@app.get("/posts/{post_id}", response_model=Post)
def get_post(post_id: int):
    """Récupérer un post spécifique"""
    if post_id not in posts_db:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Post {post_id} not found"
        )
    return posts_db[post_id]

@app.post("/posts/", response_model=Post, status_code=status.HTTP_201_CREATED)
def create_post(post: PostCreate, response: Response):
    """Créer un nouveau post"""
    global post_id_counter
    
    now = datetime.now()
    new_post = Post(
        id=post_id_counter,
        title=post.title,
        content=post.content,
        published=post.published,
        created_at=now,
        updated_at=now
    )
    
    posts_db[post_id_counter] = new_post
    response.headers["Location"] = f"/posts/{post_id_counter}"
    post_id_counter += 1
    
    return new_post

@app.put("/posts/{post_id}", response_model=Post)
def replace_post(post_id: int, post: PostCreate):
    """Remplacer complètement un post"""
    if post_id not in posts_db:
        # Créer si n'existe pas
        now = datetime.now()
        new_post = Post(
            id=post_id,
            title=post.title,
            content=post.content,
            published=post.published,
            created_at=now,
            updated_at=now
        )
        posts_db[post_id] = new_post
        return new_post
    
    # Remplacer
    existing_post = posts_db[post_id]
    updated_post = Post(
        id=post_id,
        title=post.title,
        content=post.content,
        published=post.published,
        created_at=existing_post.created_at,
        updated_at=datetime.now()
    )
    posts_db[post_id] = updated_post
    return updated_post

@app.patch("/posts/{post_id}", response_model=Post)
def update_post(post_id: int, post_updates: PostUpdate):
    """Modifier partiellement un post"""
    if post_id not in posts_db:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Post {post_id} not found"
        )
    
    existing_post = posts_db[post_id]
    update_data = post_updates.dict(exclude_unset=True)
    
    # Mettre à jour seulement les champs fournis
    updated_post = existing_post.copy()
    for field, value in update_data.items():
        setattr(updated_post, field, value)
    
    updated_post.updated_at = datetime.now()
    posts_db[post_id] = updated_post
    
    return updated_post

@app.delete("/posts/{post_id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_post(post_id: int):
    """Supprimer un post"""
    if post_id not in posts_db:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Post {post_id} not found"
        )
    
    del posts_db[post_id]
    return None  # 204 No Content
```

Cette API respecte toutes les conventions REST et montre l'usage approprié de chaque méthode HTTP !