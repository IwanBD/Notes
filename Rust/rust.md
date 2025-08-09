# Rust's Tutorial

## Instalation
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Check version
```sh
rustc --version # for rust
cargo --version # for cargo
```

### Reserved keywords
|||||
|---|---|---|---|
|abstract|dyn|impl|priv|try|
|as|else|in|pub|type|
|async|enum|let|ref|tyepof|
|await|externe|loop|return|unsafe|
|become|false|macro|self/Self|unsized|
|box|final|match|static|use|
|break|fn|mod|stuct|virtual|
|const|for|move|super|where|
|continue|gen|mut|trait|while|
|crate|if|override|true|yield|
|do|
-------------
- macro_rules
- raw
- safe
- union

## Basic program
```rs
fn main() // entry gate of the program
{
    println!("Bonjour tout le monde!"); // macro
}
```

## Creation of an executable
```sh
rustc ./filename.rs
./filename
```

## Program's comment
```rs
// monoline comment
/*
 multiline comment
*/
//! comments as documentation for a crate (module or package)

/// comment for a script, function ...
```