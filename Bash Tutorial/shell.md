# Shell Scripting Guide

## Introduction and Shebang
`.sh` is the extension used for shell scripts
`#!` is called shebang. It defines the interpreter for the current script

```bash
#!/bin/bash # means the interpreter used is bash
#!/bin/sh   # for POSIX shell
```

### Printing
```bash
echo "hello world!"           # prints hello world!
printf "Hello %s\n" "world"   # formatted output
```

### Execute a script
```bash
chmod +x filename.sh    # make executable first
./filename.sh          # run the script
bash filename.sh       # alternative way
```

## Variables
- Variable names should be uppercase (convention)
- Must not start with number
- No spaces around `=`

```bash
VARNAME="value"
echo "This is VARNAME's value: $VARNAME"

# Concatenation
SPORT="Foot" 
echo "The most popular sport is ${SPORT}ball"

# Command substitution
CURRENT_DATE=$(date)
USER_COUNT=`who | wc -l`    # backticks (older syntax)
```

### Variable Types and Special Variables
```bash
# Read-only variables
readonly PI=3.14159

# Environment variables
export PATH="/usr/local/bin:$PATH"

# Special variables
echo "Script name: $0"
echo "First argument: $1"
echo "All arguments: $@"
echo "Number of arguments: $#"
echo "Exit status: $?"
echo "Process ID: $$"
```

## User Input and Comments
```bash
# Single line comment
read -p "Enter your name: " NAME

# Multiple variables in one line
echo "Enter first and last name:"
read FNAME LNAME

# Silent input (for passwords)
read -s -p "Enter password: " PASSWORD
echo # new line after silent input
```

## Conditions and Comparisons

### Basic if/else/elif
```bash
if [ condition ]; then
    # statements
elif [ another_condition ]; then
    # statements
else
    # statements
fi
```

### Comparison Operators

#### String Comparisons
```bash
if [ "$str1" = "$str2" ]; then    # equal
if [ "$str1" != "$str2" ]; then   # not equal
if [ -z "$str" ]; then            # string is empty
if [ -n "$str" ]; then            # string is not empty
```

#### Numeric Comparisons
```bash
if [ $num1 -eq $num2 ]; then    # equal
if [ $num1 -ne $num2 ]; then    # not equal
if [ $num1 -lt $num2 ]; then    # less than
if [ $num1 -le $num2 ]; then    # less than or equal
if [ $num1 -gt $num2 ]; then    # greater than
if [ $num1 -ge $num2 ]; then    # greater than or equal
```

#### Logical Operators
```bash
if [ $a -eq 1 ] && [ $b -eq 2 ]; then    # AND
if [ $a -eq 1 ] || [ $b -eq 2 ]; then    # OR
if [ ! -f "$file" ]; then                # NOT
```

### File/Directory Test Operators
```bash
if [ -e "$file" ]; then     # exists
if [ -f "$file" ]; then     # is regular file
if [ -d "$dir" ]; then      # is directory
if [ -r "$file" ]; then     # is readable
if [ -w "$file" ]; then     # is writable
if [ -x "$file" ]; then     # is executable
if [ -s "$file" ]; then     # file size > 0
```

### Case Statements
```bash
case $variable in
    pattern1)
        # statements
        ;;
    pattern2|pattern3)
        # statements for multiple patterns
        ;;
    *)
        # default case
        ;;
esac
```

Example:
```bash
echo "Enter a letter:"
read LETTER
case $LETTER in
    [a-z])
        echo "Lowercase letter"
        ;;
    [A-Z])
        echo "Uppercase letter"
        ;;
    [0-9])
        echo "Digit"
        ;;
    *)
        echo "Special character"
        ;;
esac
```

## Arrays

### Declaring and Using Arrays
```bash
# Method 1: Direct assignment
FRUITS=("apple" "banana" "orange")

# Method 2: Index assignment
COLORS[0]="red"
COLORS[1]="green"
COLORS[2]="blue"

# Method 3: Using declare
declare -a NUMBERS=(1 2 3 4 5)

# Access elements
echo ${FRUITS[0]}        # first element
echo ${FRUITS[@]}        # all elements
echo ${FRUITS[*]}        # all elements (alternative)
echo ${#FRUITS[@]}       # array length

# Add elements
FRUITS+=("grape")        # append to array
FRUITS[10]="mango"       # assign to specific index
```

### Array Operations
```bash
# Loop through array
for fruit in "${FRUITS[@]}"; do
    echo "Fruit: $fruit"
done

# Loop with indices
for i in "${!FRUITS[@]}"; do
    echo "Index $i: ${FRUITS[$i]}"
done

# Slice arrays
echo ${FRUITS[@]:1:2}    # elements from index 1, length 2
```

## Loops

### For Loops
```bash
# Traditional for loop
for i in {1..10}; do
    echo "Number: $i"
done

# C-style for loop
for ((i=1; i<=10; i++)); do
    echo "Counter: $i"
done

# Loop through files
for file in *.txt; do
    echo "Processing: $file"
done

# Loop through command output
for user in $(cat /etc/passwd | cut -d: -f1); do
    echo "User: $user"
done
```

### While Loops
```bash
counter=1
while [ $counter -le 5 ]; do
    echo "Count: $counter"
    counter=$((counter + 1))
done

# Reading file line by line
while read -r line; do
    echo "Line: $line"
done < input.txt
```

### Until Loops
```bash
counter=1
until [ $counter -gt 5 ]; do
    echo "Count: $counter"
    counter=$((counter + 1))
done
```

### Loop Control
```bash
for i in {1..10}; do
    if [ $i -eq 3 ]; then
        continue    # skip iteration
    fi
    if [ $i -eq 8 ]; then
        break      # exit loop
    fi
    echo $i
done
```

## Functions

### Function Declaration and Usage
```bash
# Method 1
function_name() {
    # statements
    return 0    # optional return value
}

# Method 2
function function_name() {
    # statements
}

# Call function
function_name

# Function with parameters
greet() {
    local name=$1    # local variable
    echo "Hello, $name!"
    return 0
}

greet "John"
```

### Function Parameters and Return Values
```bash
calculate() {
    local num1=$1
    local num2=$2
    local operation=$3
    
    case $operation in
        "add")
            echo $((num1 + num2))
            ;;
        "subtract")
            echo $((num1 - num2))
            ;;
        *)
            echo "Unknown operation"
            return 1
            ;;
    esac
}

result=$(calculate 10 5 "add")
echo "Result: $result"
```

## Advanced Features

### Command Line Arguments
```bash
#!/bin/bash
echo "Script name: $0"
echo "Number of arguments: $#"
echo "All arguments: $@"

if [ $# -eq 0 ]; then
    echo "Usage: $0 <arg1> <arg2> ..."
    exit 1
fi

for arg in "$@"; do
    echo "Argument: $arg"
done
```

### Error Handling
```bash
set -e          # exit on any error
set -u          # exit on undefined variable
set -o pipefail # exit on pipe failure

# Custom error handling
handle_error() {
    echo "Error on line $1"
    exit 1
}

trap 'handle_error $LINENO' ERR
```

### Input/Output Redirection
```bash
# Redirect output
echo "Hello" > file.txt          # overwrite
echo "World" >> file.txt         # append

# Redirect input
while read line; do
    echo $line
done < input.txt

# Redirect both stdout and stderr
command > output.txt 2>&1

# Discard output
command > /dev/null 2>&1
```

## Practical Examples

### Enhanced Ping Sweep Script
```bash
#!/bin/bash

ping_sweep() {
    local subnet=$1
    local -a active_hosts=()
    
    echo "Scanning subnet: $subnet.0/24"
    
    for ip in {1..254}; do
        if ping -c 1 -W 1 "$subnet.$ip" > /dev/null 2>&1; then
            echo "Host $subnet.$ip is active"
            active_hosts+=("$subnet.$ip")
        fi
    done
    
    echo "Found ${#active_hosts[@]} active hosts"
    return 0
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 <subnet> (e.g., 192.168.1)"
    exit 1
fi

ping_sweep $1
```

### Menu System
```bash
#!/bin/bash

show_menu() {
    echo "=== Main Menu ==="
    echo "1. List files"
    echo "2. Show date"
    echo "3. Show users"
    echo "4. Exit"
    echo "================="
}

while true; do
    show_menu
    read -p "Enter your choice [1-4]: " choice
    
    case $choice in
        1)
            ls -la
            ;;
        2)
            date
            ;;
        3)
            who
            ;;
        4)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option!"
            ;;
    esac
    
    echo
    read -p "Press Enter to continue..."
done
```

### Log File Analyzer
```bash
#!/bin/bash

analyze_log() {
    local logfile=$1
    
    if [ ! -f "$logfile" ]; then
        echo "Error: Log file does not exist"
        return 1
    fi
    
    echo "=== Log Analysis for $logfile ==="
    echo "Total lines: $(wc -l < "$logfile")"
    echo "Error lines: $(grep -c "ERROR" "$logfile" 2>/dev/null || echo 0)"
    echo "Warning lines: $(grep -c "WARN" "$logfile" 2>/dev/null || echo 0)"
    echo "Most recent entries:"
    tail -5 "$logfile"
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 <logfile>"
    exit 1
fi

analyze_log "$1"
```

## Best Practices

1. **Always use quotes around variables**: `"$variable"`
2. **Check if files exist before using them**
3. **Use local variables in functions**
4. **Add error handling with proper exit codes**
5. **Make scripts executable**: `chmod +x script.sh`
6. **Use meaningful variable names**
7. **Comment your code**
8. **Use `set -e` for strict error handling**
9. **Validate input parameters**
10. **Use functions for repeated code**

## Common Debugging Tips

```bash
# Debug mode - shows commands being executed
set -x

# Check syntax without running
bash -n script.sh

# Add debug output
echo "DEBUG: Variable value is $var" >&2
```