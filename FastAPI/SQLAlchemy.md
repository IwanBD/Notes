# **SQLAlchemy**

## Installation
```bash
pip install sqlalchemy
# Avec drivers de base de données
pip install sqlalchemy[postgresql]  # PostgreSQL
pip install sqlalchemy[mysql]       # MySQL
pip install sqlalchemy[oracle]      # Oracle
# SQLite est inclus par défaut
```

## Configuration de base
```python
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Création de l'engine (connexion à la base)
engine = create_engine('sqlite:///example.db')  # SQLite
# engine = create_engine('postgresql://user:password@localhost/dbname')  # PostgreSQL
# engine = create_engine('mysql://user:password@localhost/dbname')       # MySQL

# Base pour les modèles
Base = declarative_base()

# Session factory
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Créer les tables
Base.metadata.create_all(bind=engine)
```

## Définition des modèles (Declarative Base)
```python
from sqlalchemy import Column, Integer, String, DateTime, Boolean, Float, Text
from sqlalchemy.ext.declarative import declarative_base
from datetime import datetime

Base = declarative_base()

class User(Base):
    __tablename__ = 'users'
    
    # Colonnes
    id = Column(Integer, primary_key=True, autoincrement=True)
    username = Column(String(50), unique=True, nullable=False, index=True)
    email = Column(String(100), unique=True, nullable=False)
    password = Column(String(255), nullable=False)
    is_active = Column(Boolean, default=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    updated_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    
    # Représentation string
    def __repr__(self):
        return f"<User(username='{self.username}', email='{self.email}')>"
```

## Types de colonnes
```python
from sqlalchemy import (
    Column, Integer, String, DateTime, Boolean, Float, Text,
    BigInteger, SmallInteger, Date, Time, DECIMAL, JSON, LargeBinary
)
from sqlalchemy.dialects.postgresql import UUID, ARRAY
import uuid

class DataTypes(Base):
    __tablename__ = 'data_types'
    
    # Types numériques
    id = Column(Integer, primary_key=True)
    big_number = Column(BigInteger)
    small_number = Column(SmallInteger)
    price = Column(Float)
    precise_price = Column(DECIMAL(10, 2))  # 10 digits, 2 decimal places
    
    # Types texte
    title = Column(String(100))  # Longueur limitée
    description = Column(Text)   # Texte long
    
    # Types temporels
    created_date = Column(Date)
    created_time = Column(Time)
    created_datetime = Column(DateTime)
    
    # Types booléens
    is_active = Column(Boolean, default=True)
    
    # Types spéciaux
    metadata_json = Column(JSON)  # Stockage JSON
    file_data = Column(LargeBinary)  # Données binaires
    
    # Types spécifiques PostgreSQL
    unique_id = Column(UUID(as_uuid=True), default=uuid.uuid4)
    tags = Column(ARRAY(String))  # Array PostgreSQL
```

## Contraintes et index
```python
from sqlalchemy import Column, Integer, String, UniqueConstraint, Index, CheckConstraint

class Product(Base):
    __tablename__ = 'products'
    
    id = Column(Integer, primary_key=True)
    name = Column(String(100), nullable=False)
    sku = Column(String(50), unique=True)  # Contrainte unique
    price = Column(Float, nullable=False)
    category = Column(String(50))
    brand = Column(String(50))
    
    # Contraintes au niveau de la table
    __table_args__ = (
        # Contrainte unique sur plusieurs colonnes
        UniqueConstraint('name', 'brand', name='unique_product_brand'),
        
        # Index sur plusieurs colonnes
        Index('idx_category_brand', 'category', 'brand'),
        
        # Contrainte de vérification
        CheckConstraint('price > 0', name='positive_price'),
    )
```

## Relations entre tables
```python
from sqlalchemy import Column, Integer, String, ForeignKey, DateTime
from sqlalchemy.orm import relationship

# One-to-Many (Un utilisateur a plusieurs posts)
class User(Base):
    __tablename__ = 'users'
    
    id = Column(Integer, primary_key=True)
    username = Column(String(50), unique=True)
    email = Column(String(100))
    
    # Relation One-to-Many
    posts = relationship("Post", back_populates="author", cascade="all, delete-orphan")
    
    # Relation One-to-One
    profile = relationship("UserProfile", back_populates="user", uselist=False)

class Post(Base):
    __tablename__ = 'posts'
    
    id = Column(Integer, primary_key=True)
    title = Column(String(200))
    content = Column(Text)
    created_at = Column(DateTime, default=datetime.utcnow)
    
    # Foreign key
    author_id = Column(Integer, ForeignKey('users.id'))
    
    # Relation Many-to-One
    author = relationship("User", back_populates="posts")
    
    # Relation Many-to-Many
    tags = relationship("Tag", secondary="post_tags", back_populates="posts")

# One-to-One
class UserProfile(Base):
    __tablename__ = 'user_profiles'
    
    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey('users.id'), unique=True)
    bio = Column(Text)
    avatar_url = Column(String(255))
    
    user = relationship("User", back_populates="profile")

# Many-to-Many avec table d'association
from sqlalchemy import Table

post_tags = Table(
    'post_tags',
    Base.metadata,
    Column('post_id', Integer, ForeignKey('posts.id'), primary_key=True),
    Column('tag_id', Integer, ForeignKey('tags.id'), primary_key=True)
)

class Tag(Base):
    __tablename__ = 'tags'
    
    id = Column(Integer, primary_key=True)
    name = Column(String(50), unique=True)
    
    posts = relationship("Post", secondary=post_tags, back_populates="tags")
```

## Sessions et requêtes de base
```python
from sqlalchemy.orm import sessionmaker

# Créer une session
SessionLocal = sessionmaker(bind=engine)
session = SessionLocal()

try:
    # CREATE - Créer un nouvel objet
    user = User(username="john_doe", email="john@example.com", password="hashed_password")
    session.add(user)
    session.commit()  # Sauvegarder
    
    # READ - Lire des données
    # Récupérer tous les utilisateurs
    users = session.query(User).all()
    
    # Récupérer un utilisateur par ID
    user = session.query(User).get(1)  # Par primary key
    user = session.query(User).filter(User.id == 1).first()
    
    # Récupérer avec filtres
    active_users = session.query(User).filter(User.is_active == True).all()
    
    # UPDATE - Mettre à jour
    user = session.query(User).filter(User.username == "john_doe").first()
    user.email = "john.doe@example.com"
    session.commit()
    
    # DELETE - Supprimer
    user_to_delete = session.query(User).filter(User.username == "john_doe").first()
    session.delete(user_to_delete)
    session.commit()
    
finally:
    session.close()
```

## Requêtes avancées
```python
from sqlalchemy import and_, or_, not_, func, desc, asc, distinct

session = SessionLocal()

# Filtres multiples
users = session.query(User).filter(
    and_(User.is_active == True, User.created_at > datetime(2023, 1, 1))
).all()

# OU logique
users = session.query(User).filter(
    or_(User.username.like('%admin%'), User.email.like('%@admin.com'))
).all()

# Négation
inactive_users = session.query(User).filter(not_(User.is_active)).all()

# LIKE, ILIKE (case insensitive)
users = session.query(User).filter(User.username.like('%john%')).all()
users = session.query(User).filter(User.email.ilike('%GMAIL%')).all()  # PostgreSQL

# IN clause
user_ids = [1, 2, 3, 4]
users = session.query(User).filter(User.id.in_(user_ids)).all()

# BETWEEN
from datetime import datetime, timedelta
last_week = datetime.now() - timedelta(days=7)
recent_users = session.query(User).filter(
    User.created_at.between(last_week, datetime.now())
).all()

# ORDER BY
users_ordered = session.query(User).order_by(User.created_at.desc()).all()
users_ordered = session.query(User).order_by(desc(User.created_at), asc(User.username)).all()

# LIMIT et OFFSET
first_10_users = session.query(User).limit(10).all()
next_10_users = session.query(User).offset(10).limit(10).all()

# DISTINCT
unique_emails = session.query(distinct(User.email)).all()

# COUNT, GROUP BY, HAVING
from sqlalchemy import func

# Compter
user_count = session.query(func.count(User.id)).scalar()

# Group by
posts_per_user = session.query(
    User.username,
    func.count(Post.id).label('post_count')
).join(Post).group_by(User.id).all()

# Having
active_users_with_posts = session.query(
    User.username,
    func.count(Post.id).label('post_count')
).join(Post).group_by(User.id).having(func.count(Post.id) > 5).all()

session.close()
```

## Jointures
```python
session = SessionLocal()

# INNER JOIN
users_with_posts = session.query(User).join(Post).all()

# LEFT JOIN
all_users_with_posts = session.query(User).outerjoin(Post).all()

# JOIN avec conditions
users_recent_posts = session.query(User).join(Post).filter(
    Post.created_at > datetime(2023, 1, 1)
).all()

# JOIN sur plusieurs tables
results = session.query(User, Post, Tag).join(Post).join(post_tags).join(Tag).all()

# Sélection de colonnes spécifiques
user_post_info = session.query(
    User.username,
    Post.title,
    Post.created_at
).join(Post).all()

session.close()
```

## Requêtes avec relations
```python
session = SessionLocal()

# Eager loading avec joinedload (JOIN)
from sqlalchemy.orm import joinedload, selectinload, subqueryload

users_with_posts = session.query(User).options(joinedload(User.posts)).all()

# Eager loading avec selectinload (requête séparée)
users_with_posts = session.query(User).options(selectinload(User.posts)).all()

# Charger plusieurs relations
users_complete = session.query(User).options(
    joinedload(User.posts),
    joinedload(User.profile)
).all()

# Requêtes sur les relations
users_with_many_posts = session.query(User).filter(
    User.posts.any(Post.created_at > datetime(2023, 1, 1))
).all()

# Compter les relations
users_post_count = session.query(User).filter(
    func.count(User.posts) > 5
).all()

session.close()
```

## Requêtes raw SQL
```python
from sqlalchemy import text

session = SessionLocal()

# Requête SQL brute
result = session.execute(text("SELECT * FROM users WHERE is_active = :active"), {"active": True})
users = result.fetchall()

# Mapper vers des objets
users = session.query(User).from_statement(
    text("SELECT * FROM users WHERE created_at > :date")
).params(date=datetime(2023, 1, 1)).all()

session.close()
```

## Transactions
```python
session = SessionLocal()

try:
    # Début de transaction (automatique)
    user = User(username="test_user", email="test@example.com")
    session.add(user)
    
    post = Post(title="Test Post", content="Content", author=user)
    session.add(post)
    
    # Valider la transaction
    session.commit()
    
except Exception as e:
    # Annuler en cas d'erreur
    session.rollback()
    print(f"Erreur: {e}")
    
finally:
    session.close()

# Context manager pour gestion automatique
from contextlib import contextmanager

@contextmanager
def get_db_session():
    session = SessionLocal()
    try:
        yield session
        session.commit()
    except Exception as e:
        session.rollback()
        raise e
    finally:
        session.close()

# Utilisation
with get_db_session() as session:
    user = User(username="auto_managed", email="auto@example.com")
    session.add(user)
    # Commit automatique si pas d'erreur
```

## Bulk operations
```python
session = SessionLocal()

# Bulk insert
users_data = [
    {"username": f"user{i}", "email": f"user{i}@example.com"}
    for i in range(1000)
]
session.bulk_insert_mappings(User, users_data)
session.commit()

# Bulk update
session.bulk_update_mappings(User, [
    {"id": 1, "is_active": False},
    {"id": 2, "is_active": False},
])
session.commit()

# Update en masse avec query
session.query(User).filter(User.created_at < datetime(2022, 1, 1)).update(
    {"is_active": False}
)
session.commit()

# Delete en masse
session.query(User).filter(User.is_active == False).delete()
session.commit()

session.close()
```

## Events et Hooks
```python
from sqlalchemy import event

# Before insert
@event.listens_for(User, 'before_insert')
def before_insert_user(mapper, connection, target):
    print(f"Inserting user: {target.username}")
    target.created_at = datetime.utcnow()

# After insert
@event.listens_for(User, 'after_insert')
def after_insert_user(mapper, connection, target):
    print(f"User inserted with ID: {target.id}")

# Before update
@event.listens_for(User, 'before_update')
def before_update_user(mapper, connection, target):
    target.updated_at = datetime.utcnow()

# Before delete
@event.listens_for(User, 'before_delete')
def before_delete_user(mapper, connection, target):
    print(f"Deleting user: {target.username}")
```

## Validation et propriétés
```python
from sqlalchemy.orm import validates
from sqlalchemy.ext.hybrid import hybrid_property

class User(Base):
    __tablename__ = 'users'
    
    id = Column(Integer, primary_key=True)
    username = Column(String(50))
    email = Column(String(100))
    password = Column(String(255))
    first_name = Column(String(50))
    last_name = Column(String(50))
    
    # Validation
    @validates('email')
    def validate_email(self, key, address):
        if '@' not in address:
            raise ValueError("Invalid email address")
        return address
    
    @validates('username')
    def validate_username(self, key, username):
        if len(username) < 3:
            raise ValueError("Username must be at least 3 characters")
        return username
    
    # Propriété hybride (accessible en Python et SQL)
    @hybrid_property
    def full_name(self):
        return f"{self.first_name} {self.last_name}"
    
    @full_name.expression
    def full_name(cls):
        return func.concat(cls.first_name, ' ', cls.last_name)
    
    # Propriété calculée
    @property
    def is_admin(self):
        return self.username.startswith('admin_')

# Utilisation de propriété hybride en requête
session.query(User).filter(User.full_name.like('%John Doe%')).all()
```

## Migrations avec Alembic
```bash
# Installation
pip install alembic

# Initialisation
alembic init alembic

# Créer une migration
alembic revision --autogenerate -m "Add user table"

# Appliquer les migrations
alembic upgrade head

# Revenir à une migration précédente
alembic downgrade -1
```

Configuration Alembic (`alembic.ini` et `env.py`):
```python
# env.py
from sqlalchemy import engine_from_config, pool
from alembic import context
from your_app.models import Base  # Vos modèles

target_metadata = Base.metadata

def run_migrations_online():
    connectable = engine_from_config(
        config.get_section(config.config_ini_section),
        prefix="sqlalchemy.",
        poolclass=pool.NullPool,
    )

    with connectable.connect() as connection:
        context.configure(
            connection=connection, 
            target_metadata=target_metadata
        )

        with context.begin_transaction():
            context.run_migrations()
```

## Connection Pool et Performance
```python
from sqlalchemy import create_engine
from sqlalchemy.pool import QueuePool

# Configuration du pool de connexions
engine = create_engine(
    'postgresql://user:password@localhost/dbname',
    poolclass=QueuePool,
    pool_size=20,          # Nombre de connexions permanentes
    max_overflow=30,       # Connexions supplémentaires
    pool_recycle=3600,     # Recycler les connexions après 1h
    echo=True              # Afficher les requêtes SQL (debug)
)

# Lazy loading vs Eager loading
session = SessionLocal()

# Lazy loading (requêtes supplémentaires)
user = session.query(User).first()
posts = user.posts  # Requête SQL supplémentaire

# Eager loading (une seule requête)
from sqlalchemy.orm import joinedload
user = session.query(User).options(joinedload(User.posts)).first()
posts = user.posts  # Pas de requête supplémentaire

session.close()
```

## Schémas et contextes multiples
```python
# Modèles avec schémas différents
class UserMain(Base):
    __tablename__ = 'users'
    __table_args__ = {'schema': 'main'}
    
    id = Column(Integer, primary_key=True)
    username = Column(String(50))

class UserArchive(Base):
    __tablename__ = 'users'
    __table_args__ = {'schema': 'archive'}
    
    id = Column(Integer, primary_key=True)
    username = Column(String(50))

# Requêtes sur différents schémas
main_users = session.query(UserMain).all()
archive_users = session.query(UserArchive).all()
```

## Fonctions SQL avancées
```python
from sqlalchemy import func, case, cast, String

session = SessionLocal()

# Fonctions d'agrégation
stats = session.query(
    func.count(User.id).label('total_users'),
    func.avg(Post.id).label('avg_posts'),
    func.max(User.created_at).label('latest_user'),
    func.min(User.created_at).label('earliest_user')
).join(Post).first()

# CASE WHEN
user_status = session.query(
    User.username,
    case(
        (User.is_active == True, 'Active'),
        (User.is_active == False, 'Inactive'),
        else_='Unknown'
    ).label('status')
).all()

# CAST (conversion de type)
user_ids_as_string = session.query(
    cast(User.id, String).label('id_string')
).all()

# Window functions (PostgreSQL)
from sqlalchemy import text

ranked_users = session.execute(text("""
    SELECT username, 
           ROW_NUMBER() OVER (ORDER BY created_at) as row_num,
           RANK() OVER (ORDER BY created_at) as rank
    FROM users
""")).fetchall()

session.close()
```

## Patterns et bonnes pratiques

### Repository Pattern
```python
from abc import ABC, abstractmethod
from typing import List, Optional

class UserRepository(ABC):
    @abstractmethod
    def get_by_id(self, user_id: int) -> Optional[User]:
        pass
    
    @abstractmethod
    def get_by_username(self, username: str) -> Optional[User]:
        pass
    
    @abstractmethod
    def create(self, user: User) -> User:
        pass

class SQLAlchemyUserRepository(UserRepository):
    def __init__(self, session):
        self.session = session
    
    def get_by_id(self, user_id: int) -> Optional[User]:
        return self.session.query(User).get(user_id)
    
    def get_by_username(self, username: str) -> Optional[User]:
        return self.session.query(User).filter(User.username == username).first()
    
    def create(self, user: User) -> User:
        self.session.add(user)
        self.session.commit()
        self.session.refresh(user)
        return user
```

### Service Layer
```python
class UserService:
    def __init__(self, user_repository: UserRepository):
        self.user_repository = user_repository
    
    def create_user(self, username: str, email: str, password: str) -> User:
        # Logique métier
        if self.user_repository.get_by_username(username):
            raise ValueError("Username already exists")
        
        user = User(username=username, email=email, password=password)
        return self.user_repository.create(user)
```

### Gestion des sessions avec dépendances
```python
# Pour FastAPI
from fastapi import Depends

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def get_user_repository(db: Session = Depends(get_db)):
    return SQLAlchemyUserRepository(db)

def get_user_service(user_repo: UserRepository = Depends(get_user_repository)):
    return UserService(user_repo)
```