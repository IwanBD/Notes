# **PYDANTIC**

## Installation
```bash
pip install pydantic
# Avec extensions optionnelles
pip install pydantic[email,dotenv]
```

## Modèle de base
```python
from pydantic import BaseModel

class User(BaseModel):
    name: str
    age: int
    email: str

# Utilisation
user = User(name="John", age=30, email="john@example.com")
print(user.name)  # John
print(user.dict())  # {'name': 'John', 'age': 30, 'email': 'john@example.com'}
print(user.json())  # JSON string
```

## Types de données supportés

### Types de base
```python
from typing import Optional, List, Dict, Set, Tuple
from datetime import datetime, date, time
from uuid import UUID
from decimal import Decimal

class DataTypes(BaseModel):
    # Types Python de base
    text: str
    number: int
    price: float
    active: bool
    
    # Types optionnels
    description: Optional[str] = None
    
    # Collections
    tags: List[str] = []
    metadata: Dict[str, str] = {}
    unique_ids: Set[int] = set()
    coordinates: Tuple[float, float]
    
    # Types spéciaux
    created_at: datetime
    birth_date: date
    alarm_time: time
    user_id: UUID
    precise_price: Decimal
```

### Types Pydantic spécialisés
```python
from pydantic import BaseModel, EmailStr, HttpUrl, SecretStr, constr, conint

class SpecialTypes(BaseModel):
    email: EmailStr  # Validation automatique d'email
    website: HttpUrl  # Validation d'URL
    password: SecretStr  # Masque la valeur dans les logs
    
    # Types contraints
    username: constr(min_length=3, max_length=20, regex="^[a-zA-Z0-9_]+$")
    age: conint(ge=0, le=150)  # ge = greater or equal, le = less or equal
```

## Valeurs par défaut
```python
from typing import Optional
from datetime import datetime
from pydantic import Field

class DefaultValues(BaseModel):
    # Valeurs par défaut simples
    name: str = "Anonymous"
    active: bool = True
    tags: List[str] = []
    
    # Valeurs par défaut avec Field
    created_at: datetime = Field(default_factory=datetime.now)
    score: int = Field(default=0, description="User score")
    
    # Valeurs optionnelles
    description: Optional[str] = None
    
    # Factory functions pour valeurs mutables
    metadata: Dict = Field(default_factory=dict)
```

## Validation avec Field
```python
from pydantic import BaseModel, Field, validator
from typing import List

class Product(BaseModel):
    name: str = Field(..., min_length=1, max_length=100)
    price: float = Field(..., gt=0, description="Price must be positive")
    description: str = Field(None, max_length=500)
    tags: List[str] = Field(default=[], max_items=10)
    rating: float = Field(0.0, ge=0.0, le=5.0)
    
    # Field avec alias
    product_id: int = Field(..., alias="id")
```

## Validators personnalisés
```python
from pydantic import BaseModel, validator, root_validator
import re

class User(BaseModel):
    name: str
    email: str
    age: int
    password: str
    confirm_password: str

    # Validator simple
    @validator('name')
    def name_must_contain_space(cls, v):
        if ' ' not in v:
            raise ValueError('Name must contain a space')
        return v.title()  # Capitalise
    
    # Validator avec regex
    @validator('email')
    def validate_email(cls, v):
        pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$'
        if not re.match(pattern, v):
            raise ValueError('Invalid email format')
        return v.lower()
    
    # Validator avec paramètres
    @validator('age')
    def validate_age(cls, v):
        if v < 0:
            raise ValueError('Age must be positive')
        if v > 150:
            raise ValueError('Age must be realistic')
        return v
    
    # Validator sur plusieurs champs
    @validator('password')
    def password_strength(cls, v):
        if len(v) < 8:
            raise ValueError('Password must be at least 8 characters')
        if not re.search(r'[A-Z]', v):
            raise ValueError('Password must contain uppercase')
        if not re.search(r'[0-9]', v):
            raise ValueError('Password must contain digit')
        return v
    
    # Root validator (accès à tous les champs)
    @root_validator
    def passwords_match(cls, values):
        password = values.get('password')
        confirm_password = values.get('confirm_password')
        if password != confirm_password:
            raise ValueError('Passwords do not match')
        return values
```

## Modèles imbriqués
```python
from typing import List, Optional

class Address(BaseModel):
    street: str
    city: str
    country: str
    postal_code: str

class Contact(BaseModel):
    phone: str
    email: str

class User(BaseModel):
    name: str
    age: int
    address: Address  # Modèle imbriqué
    contact: Optional[Contact] = None
    addresses: List[Address] = []  # Liste de modèles

# Utilisation
user_data = {
    "name": "John Doe",
    "age": 30,
    "address": {
        "street": "123 Main St",
        "city": "Paris",
        "country": "France",
        "postal_code": "75001"
    },
    "addresses": [
        {"street": "456 Oak Ave", "city": "Lyon", "country": "France", "postal_code": "69001"}
    ]
}

user = User(**user_data)
print(user.address.city)  # Paris
```

## Héritage de modèles
```python
class BaseUser(BaseModel):
    name: str
    email: str
    created_at: datetime = Field(default_factory=datetime.now)

class RegularUser(BaseUser):
    subscription_type: str = "basic"

class AdminUser(BaseUser):
    permissions: List[str] = []
    is_superuser: bool = False

# Utilisation
admin = AdminUser(
    name="Admin",
    email="admin@example.com",
    permissions=["read", "write", "delete"]
)
```

## Configuration des modèles
```python
class User(BaseModel):
    name: str
    age: int
    
    class Config:
        # Validation lors de l'assignation
        validate_assignment = True
        
        # Utiliser les noms d'attributs comme alias
        allow_population_by_field_name = True
        
        # Interdire les champs supplémentaires
        extra = "forbid"  # ou "ignore" ou "allow"
        
        # Cas des noms de champs
        alias_generator = lambda field_name: field_name.replace('_', '-')
        
        # Exemple de valeurs
        schema_extra = {
            "example": {
                "name": "John Doe",
                "age": 30
            }
        }

# Avec extra = "forbid"
try:
    user = User(name="John", age=30, extra_field="not allowed")
except ValueError as e:
    print(e)  # extra fields not permitted
```

## Conversion et parsing
```python
from pydantic import BaseModel
import json

class User(BaseModel):
    name: str
    age: int

# Depuis un dictionnaire
user_dict = {"name": "John", "age": "30"}  # age est une string
user = User(**user_dict)  # Conversion automatique
print(user.age, type(user.age))  # 30 <class 'int'>

# Depuis JSON
user_json = '{"name": "Jane", "age": 25}'
user = User.parse_raw(user_json)

# Depuis un fichier JSON
user = User.parse_file('user.json')

# Vers dictionnaire
user_dict = user.dict()

# Vers JSON
user_json = user.json()
```

## Alias et sérialisation
```python
from pydantic import BaseModel, Field

class User(BaseModel):
    name: str = Field(alias="full_name")
    user_id: int = Field(alias="id")
    is_active: bool = Field(alias="active", default=True)

# Parsing avec alias
data = {"full_name": "John Doe", "id": 123, "active": False}
user = User(**data)

# Sérialisation
print(user.dict())  # Utilise les noms de champs originaux
print(user.dict(by_alias=True))  # Utilise les alias

# Exclure/inclure des champs
print(user.dict(exclude={"is_active"}))
print(user.dict(include={"name", "user_id"}))
```

## Union et types conditionnels
```python
from typing import Union
from pydantic import BaseModel

class Cat(BaseModel):
    pet_type: str = "cat"
    meows: int

class Dog(BaseModel):
    pet_type: str = "dog"
    barks: float

class Owner(BaseModel):
    name: str
    pet: Union[Cat, Dog]  # Peut être Cat ou Dog

# Utilisation
owner1 = Owner(name="Alice", pet={"pet_type": "cat", "meows": 5})
owner2 = Owner(name="Bob", pet={"pet_type": "dog", "barks": 3.5})
```

## Validators avancés
```python
from pydantic import BaseModel, validator
from typing import List

class Product(BaseModel):
    name: str
    tags: List[str]
    price: float
    
    # Pre validator (s'exécute avant la conversion de type)
    @validator('price', pre=True)
    def parse_price(cls, v):
        if isinstance(v, str):
            return float(v.replace('$', '').replace(',', ''))
        return v
    
    # Validator avec each_item pour les listes
    @validator('tags', each_item=True)
    def tags_must_be_lowercase(cls, v):
        return v.lower().strip()
    
    # Validator qui dépend d'autres champs
    @validator('name')
    def name_must_not_contain_price(cls, v, values):
        if 'price' in values and str(values['price']) in v:
            raise ValueError('Name cannot contain price')
        return v

# Test
product = Product(
    name="Gaming Mouse",
    tags=["GAMING", "  MOUSE  ", "RGB"],
    price="$29.99"
)
print(product.tags)  # ['gaming', 'mouse', 'rgb']
print(product.price)  # 29.99
```

## Gestion des erreurs
```python
from pydantic import BaseModel, ValidationError

class User(BaseModel):
    name: str
    age: int
    email: str

try:
    user = User(name="John", age="invalid", email="not-email")
except ValidationError as e:
    print(e.json(indent=2))
    # Affiche les erreurs détaillées en JSON
    
    for error in e.errors():
        print(f"Field: {error['loc']}, Error: {error['msg']}")
```

## Generic Models
```python
from typing import Generic, TypeVar
from pydantic import BaseModel
from pydantic.generics import GenericModel

DataT = TypeVar('DataT')

class Response(GenericModel, Generic[DataT]):
    success: bool
    message: str
    data: DataT

class User(BaseModel):
    name: str
    age: int

# Utilisation
user_response = Response[User](
    success=True,
    message="User retrieved successfully",
    data=User(name="John", age=30)
)

list_response = Response[List[User]](
    success=True,
    message="Users retrieved",
    data=[User(name="John", age=30), User(name="Jane", age=25)]
)
```

## Dataclasses avec Pydantic
```python
from pydantic.dataclasses import dataclass
from pydantic import validator

@dataclass
class User:
    name: str
    age: int
    
    @validator('age')
    def validate_age(cls, v):
        if v < 0:
            raise ValueError('Age must be positive')
        return v

# Utilisation comme une dataclass normale mais avec validation
user = User(name="John", age=30)
```

## Settings et variables d'environnement
```python
from pydantic import BaseSettings, Field
import os

class Settings(BaseSettings):
    app_name: str = "My App"
    debug: bool = False
    database_url: str
    secret_key: str = Field(..., env="SECRET_KEY")
    max_connections: int = Field(10, env="MAX_CONN")
    
    class Config:
        env_file = ".env"
        env_file_encoding = 'utf-8'

# Lecture automatique depuis les variables d'environnement et .env
settings = Settings()

# Ou explicitement
settings = Settings(database_url="postgresql://localhost/db")
```

## JSON Schema
```python
from pydantic import BaseModel, Field

class User(BaseModel):
    name: str = Field(..., title="Full Name", description="The user's full name")
    age: int = Field(..., title="Age", description="Age in years", ge=0, le=150)

# Générer le JSON Schema
schema = User.schema()
print(schema)

# Schema avec exemple
class Product(BaseModel):
    name: str
    price: float
    
    class Config:
        schema_extra = {
            "example": {
                "name": "Gaming Mouse",
                "price": 29.99
            }
        }
```

## Custom Types
```python
from pydantic import BaseModel, validator
from typing import Any

class PositiveInt:
    @classmethod
    def __get_validators__(cls):
        yield cls.validate
    
    @classmethod
    def validate(cls, v):
        if not isinstance(v, int) or v <= 0:
            raise ValueError('Must be a positive integer')
        return v

class Product(BaseModel):
    name: str
    quantity: PositiveInt

# Utilisation
product = Product(name="Mouse", quantity=5)  # OK
# product = Product(name="Mouse", quantity=-1)  # ValidationError
```

## Modèles immutables
```python
from pydantic import BaseModel

class ImmutableUser(BaseModel):
    name: str
    age: int
    
    class Config:
        allow_mutation = False  # Rend le modèle immutable

user = ImmutableUser(name="John", age=30)
# user.age = 31  # Erreur ! Cannot assign to field
```

## Export et copy
```python
user = User(name="John", age=30, email="john@example.com")

# Copie avec modifications
user_copy = user.copy(update={"age": 31})

# Export vers différents formats
user_dict = user.dict()
user_json = user.json()
user_dict_exclude = user.dict(exclude={"email"})
user_dict_include = user.dict(include={"name", "age"})

# Deep copy pour modèles imbriqués
user_deep_copy = user.copy(deep=True)
```

## Bonnes pratiques

### Organisation des modèles
```python
# models/user.py
from pydantic import BaseModel, validator
from typing import Optional
from datetime import datetime

class UserBase(BaseModel):
    """Base class for User models"""
    name: str
    email: str

class UserCreate(UserBase):
    """Model for creating a user"""
    password: str
    
    @validator('password')
    def validate_password(cls, v):
        if len(v) < 8:
            raise ValueError('Password too short')
        return v

class UserUpdate(BaseModel):
    """Model for updating a user"""
    name: Optional[str] = None
    email: Optional[str] = None

class UserInDB(UserBase):
    """Model for user in database"""
    id: int
    created_at: datetime
    is_active: bool = True

class UserResponse(UserBase):
    """Model for user response"""
    id: int
    created_at: datetime
    
    class Config:
        orm_mode = True  # Pour SQLAlchemy
```

### Réutilisation et composition
```python
from pydantic import BaseModel

class TimestampMixin(BaseModel):
    created_at: datetime = Field(default_factory=datetime.now)
    updated_at: Optional[datetime] = None

class User(TimestampMixin):
    name: str
    email: str

class Product(TimestampMixin):
    name: str
    price: float
```