# Python subprocesses

First of all, we need to import the subprocess module:
```import subprocess```

## run a command in the terminal

```
subprocess.run("commad goes here")
```

> NB: 

- we can add args by doing like the following
  
  ```
  subprocess.run(["command", "argument])
  ```
  
  **EX:**
  
  ```
  subprocess.run(["ls", "-l"])
  ```
- if we want to run the command in a form of a string we can add the optional argument ```shell``` to True
  
  ```
  subprocess.run("all the command in a form of a string", shell=True)
  ```
  
  **EX:**
  
  ```
  subprocess.run("ls -l")
  ```

## Capture the output of the command

- store the output of ```subprocess.run``` in a variable
  
  ```
  p1 = subprocess.run("commad")
  ```
  
  *It does not work*
  But let see what we can do with this variable
  - p1.returncode: returns 0 if everything runs well, and 1 when there is an error
  - p1.args: returns the arguments passed to the function
  - p1.stdout: will print ```NONE```, because, it have already printed it out in the console.
      Thus, in order to capture the output, we must add the parameter ```capture_output``` and set it to True.
    
    ```
    p1 = subprocess.run("commad", capture_output=True)
    print(p1.stdout)
    ```
    
      or:
    
    ```
    p1 = subprocess.run("commad", stdout=subprocess.PIPE)
    print(p1.stdout)
    ```
    
      In the case we need to track the output in a file:
    
    ```
    with open("file.txt", "w") as file:
        subprocess.run("commad", stdout=file)
    ```

# Capture errors

- we can use the ```returncode``` attribut to check when an error occurs or use the attribut ```stderr```. When there is not an error, it will return NONE
  
  ```
  print(p1.stderr)
  ```
  - throw an exception
    
    ```
    p1 = subprocess.run("commad", capture_output=True, check=True)
    ```
  - redirect the output of exception to a file:
    
    ```
    with open("file_err.txt", "w") as file:
    subprocess.run("command", shell=True, stderr=file)
    ```