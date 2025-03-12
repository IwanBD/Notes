# NUMPY

## Installations
```py
pip install numpy
```

## Import
```py
import numpy as np
```

## Get the current version
```py
print(np.__version__)
```

## creation of a numpy object
```py
x = np.array([v1, v2, ...,vn])
```

## convert a numpy object to a list
```py
l = list(x)
```

## Get the shape of the numpy object
```py
x.shape
```

## Get the type of data in the object
```py
x.dtype
```

## Get the dimension of the object
```py
x.ndim
```

## Get the size of the object
```py
x.size
```

## Access to a specific element
```py
x[index]
# if it is a multi-dimentsional array
x[row][col]
# or
x[row, col]
```

## Access to a specific section
```py
# all rows and cols
x[:]
# from row y to row n
x[y:n]
# all cols a of each row
x[:, ]
# from col a to b of each row
x[:, a:b]
# from col a to b of row y to n
x[y:n, a:b]
# SIMPLE PROTOTYPE
x[start_row,end_row: start_col,end_col]
```
> We can still use the negative indexes

## Boolean indexation
> The boolean indexation is a comparison between a numpy object and a specified value returning another numpy array with the same shape and containing booleans (True when the condition is met and False when it is not) 
```py
bool_idx = x conditional_operator compared_value
```
> Moreover, it is possible to reuse the boolean indexed numpy array as an index for the numpy array and return only positions where conditions are met (will return only one-dimensional array)
```py
x[bool_inx ]
# or
x[x conditional_operator compared_value ]
```

# Fancy indexing
> In numpy, it is possible to return a list of specific indexes, whatever indexes' order
```py
l = [idx, idx2, idx3]
a = x[l]
```

## Dot product
The dot product is the sum of all products of corresponding entries between different matrix
```py
a = np.dot(x1, x2)
#or
a = x @ x2
```

## Transpose an array (during the transposition operation, the rows become the cols and vice versa)
```py
y = x.T
```

## Compute the determinant
```py
y = np.linalg.det(x)
```

## Get the diagonal of a  numpy array
```py
diag = np.diag(a)
```

## Reshaping arrays
```py
x = np.arange(start, end) # creates a numpy array with values from start to end -1
```
```py
a = x.reshape((n_rows, n_cols))
```
> NB: n_rows * n_cols = end - 1

## Arrays' concatenation
> The concatenation is done according the axis. Moreover, if the axis = 0, it is added as a new row; if axis = 1, it is added as a new column. By default, the axis is 0.
```py
y = np.array([v1, v2, ...,vn])
x = np.array([v1, v2, ...,vn])
z = np.concatenate((x,y))
```
> When the axis = 0, both arrays must have the same number of columns and when the axis = 1, they must have the same number of rows

**hstack & vstack**
`hstack` concatenates arrays horizontaly while `vstack` concatenates them vertically

_Use case_
```py
# HSTACK
x = np.array([[1, 2], [3, 4]])
y = np.array([[5, 6], [7, 8]]) 
z = np.hstack((x, y))

print(z)
# OUTPUT
"""
[
    [1 2 5 6]
    [3 4 7 8]
]
"""
# VSTACK
x = np.array([[1, 2], [3, 4]])
y = np.array([[5, 6], [7, 8]]) 
z = np.vstack((x, y))

print(z)
# OUTPUT
"""
[
    [1 2]
    [3 4]
    [5 6]
    [7 8]
]
"""
```

## Broadcasting
> It is a mechanism that allows to perform arithmetics operations with arrays of differents shape.
> Arithmetic operations on arrays are usually done on corresponding elements. If two arrays are of exactly the same shape, then these operations are smoothly performed.

## Data Science Functions
`sum`, `mean`, `std`, `max`, `min`, `var`,
```py
sum = x.sum() # flattens the array and calculates the sum of each contained elements. Same as x.sum(axis=None)
sum = x.sum(axis=1) # makes the sum column by column
sum = x.sum(axis=0) # makes the sum row by row
```
> They can be used as the following also:
> ```py
> sum = np.sum(x, axis=None)
> ```

## Create numpy arrays with dummies values
```py
x = np.zeros((n, m)) # creates a zero-matrix of n rows and m cols
x = np.ones((n, m)) # creates a one-matrix of n rows and m cols
x = np.full((n, m), v) # creates  matrix of n rows and m cols with filled the value v
x = np.eye(n) # creates an eye-matrix (diagonal matrix) of n rows and cols of value 1
x = np.linspace(n, m, t) # creates an array of t values starting from n to m with the step of (m-n+1)/t
x = np.random.random((n, m)) # creates an array of n*m, with random values between 0 and 1
x = np.random.randn(n, m) # creates an array of n*m, with random values between -1 and 1. The second parameter can be optional
x = np.random.randint(n, m, size=(t,p)) # random values between n and m with a size of t*p 
```

## Eigenvalues

# Load data from a file
```py
data = np.loadtxt(file_path, delimiter=_delimiter, dtype=np_data_type)
# or
data = np.genfromtxt(file_path, delimiter=_delimiter, dtype=np_data_type)
``` 
