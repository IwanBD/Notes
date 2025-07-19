# Multithreading Python
First of all we will need to import the threading module
```import threading```

## create a thread
```
thread1 = threading.Thread(target=<Name of the function>)
```
> Note: The name of the function must be pass as for the callback.
> We do note put the parenthesis

# start a thread
```
thread1.start()
```

# wait for the execution of a thread before continuing to execution of the rest of code

*when we start a thread, it lauches the targeted function then, in parallel, executes the rest of the code*

```
thread1.join()
```

# Pass args to the function targeted in treads
```
thread1 = threading.Thread(target=<Name of the function>, args=[arg1, ...argn])
```