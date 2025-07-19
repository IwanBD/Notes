# BEAUTIFUL SOUP TUTORIAL

## Installation
```sh
pip install beautifulsoup4
```
> It is sometimes better to fetch all content of the webpage via the `requests` library
_Example:_
```sh
r = requests.get(url)
soup = bs(r.content)
print(soup.prettify)
```

## find a first tag of a website
```sh
first = soup.find(tag_name)
```

## find all tags by specifying it
```sh
all_tags = soup.find_all(tag_name)
```

> **NB**: The `find_all` and `find` methods can take a list of tag.
> Moreover these methods can take tag attributs
__Example:__
```py
all_tags = soup.all(tag_name, attrs={"attribute1":"value", "attribute2":"value"})
```

## Nesting find/find_all
```py
body = soup.find('body')
div = body.find('div')
header = div.find("h1")
print(div)
```

## find a specific string with the regex
```py
all_tags = soup.find_all(tag_name, string="write the specific string here")
```
or we can use the `regex re` module
```py
all_tags = soup.find_all(tag_name, string=re.compile("write a piece the specific string here"))
```
## Select with CSS selector
```py
content = soup.select(css_selector)
```

## Grabb only the text contained in a tag
```py
text = soup.find
content = soup.find(tag_name)
print(content.string)
```

## Grabb whole text contained in a tag and its childs
```py
text = soup.find
content = soup.find(tag_name)
print(content.get_text())
```

## Getting a property of HTML elemement (href, src, id, class ...)
```
content = soup.find(tag_name)
property(content[property])
```

## Code navigation (parents, children, siblings)
_Example:_
```py
content = soup.body.div.p
print(content)
```
**Tree navigation**
_Attributs_
- contents
- children
- descendants
- string & stripped_string
- parent and parents
- next_sibling and previous_sibling
- next_siblings and previous_siblings
- next_element & previous_element
- next_elements & previous_elements
  
_Methods_
- find()
- find_parents() and find_parent()
- find_next_siblings() and find_next_sibling()
- find_previous_siblings() and find_previous_sibling()
- find_all_next() and find_next()
- find_all_previous() and find_previous()