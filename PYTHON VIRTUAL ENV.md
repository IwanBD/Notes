---
title: PYTHON VIRTUAL ENV
created: '2022-10-17T16:55:00.639Z'
modified: '2022-10-18T09:46:49.843Z'
---

# PYTHON VIRTUAL ENV

## Installation
```sh
pip install virtualenv
```

## Setup of a virtual environment
```sh
virtualenv [name_of_virtual_env_folder]
```

## Activation of the virtual environment
```sh
source [path_to_the_virtual_env/bin/activate];
```

## List the available packages in the virtual environment
```sh
pip list
```

## Export the availables installed packages
```sh
pip --locale > path_to_exporting_file
```

## Desactivate the virtual environment
```sh
deactivate
```

## Load exported installed packages
```sh
pip install -r path_to_exported_file
```
