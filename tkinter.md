# TKINTER

## Import the module
```py
from tkinter import *
```

## Instanciate an instance of windows
```
windows = Tk()
```

## Display a window
```py
window.mainloop()
```

## Size the window
```py
window.geometry("windthxheight")
```

## Change the title of the window
```py
window.title("title of the program")
```

## Change the icon in the top bar of the UI
```py
icon = PhotoImage(file="Path to the file")
window.iconphoto(True, icon)#sets the icon
```
> NB: The `PhotoImage` helps to transform image files into a format that can be handled by Tkinter.

## Change the background of the window
```py
window.config(background="#hex")# add the hexadecimal color of the bg you want
```

## Add text (Labels)
```py
label = Label(master=window, text="Add your text here ...", font=('font_name', font_size, 'font_style'), foreground="#hex", background="#hex")
```

## Display the widget on the window
```py
widget.pack()
#or
widget.place(x=pos_x, y=pos_y)
```

## Add a button
```py
button = Button(master=window, text="Button label goes here !", command=callback, font=('font_name', font_size, 'font_style'), foreground="#hex", background="#hex", activeforeground="#hex", activebackground="#hex", state=ACTIVE|DISABLED, image=PhotoImage(file="file path"), compound="top|bottom|top|left|right")
```
>NB: The `callback` is a function that must be predefined. It must be called without parenthesis.
>If the 

## Add an input (entry)
```py
entry = Entry(master=window, font=('font_name', font_size, 'font_style'), foreground='#hex', background='#hex', show="char ")
```

## Delete the content of an entry
```py
entry.delete(0, END) # deletes all the content of the entry
entry.delete(x, y) # deletes from index x to y
```

## Retrieve the content of an entry
```py
entry.get()
```
## Add Checkbox (CheckButton)
```py
x = IntVar()|StringVar()|BoolVar()
check_btn = Checkbutton(master=window,
    text="checkbox text ...",
    variable=x,
    onvalue=1,
    offvalue=0,
    command=callback,
    font=('font_name', font_size, 'font_style'),
    foreground='#hex',
    background='#hex',
    activeforeground='#hex', activebackground='#hex',
    image=PhotoImage(file="file path"),
    compound="top|bottom|top|left|right"
    )
```

## Add radiobutton
```py
x = IntVar()
radioLabels = [...] # list of elements of the radiobuttons
for index in range(len(radioLabels)):
    radio_btn = Radiobutton(master=window,
    text=radioLabels[index], # adds text to the radio button
    variable=x, # groups radiobuttons togheter if they share the name variable
    value=index, # assigns each radio button a different value
    indicatoron = 0, # eleminates the circle indicators
    font=('font_name', font_size, 'font_style'),
    foreground='#hex',
    background='#hex',
    activeforeground='#hex', activebackground='#hex',
    image=PhotoImage(file="file path"),
    compound="top|bottom|top|left|right"
    )
```

## Add a scale