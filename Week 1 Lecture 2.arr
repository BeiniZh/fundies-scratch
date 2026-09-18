use context starter2024
#include image

" hello world "
```
Hello
There
```
circle(30, "solid", "blue")


# 把 a 定义成“hello world” 然后执行 a
a=" hello world "
b= a + ''

string-length(b)
string-repeat(b, 3)


#前提是 + 前后都是strings
"CS" + "2000"

string-to-upper("hello cs2000!") #-> HELLO CS2000!
string-toupper("hello cs2000!")


#to convert all string characters to lower case
string-to-lower("WELCOME TO CS 2000")


#to get a substring
string-substring("Welcome to london", 0, 7) #-> Welcome

sample_string="Hello , how are you? My name is Jeff, and i am from London"


#to check if certain characters exist in a string
string-contains(sample_string,"Jeff")
string-contains(sample_string,"Bond")
string-contains(sample_string,"is Jeff")


sample_string2=" Hello, worlds? How are you today? i am Beini."
string-to-upper(sample_string2)
string-contains(sample_string,"beini")


#some images
circle(30,"solid", "green")
rectangle(120,20,"solid","red")
triangle(50,"outline","purple")


#overlays, composition, each of these takes two images and gives back one image
overlay(circle(30,"solid","blue"),rectangle(80, 60,"solid","yellow"))
#overlay((first image),(second image))

#above((first image),(second image))
#below((first image),(second image))
#beside((first image),(second image))

above((triangle(60,"outline","red")) , (rectangle(120,80,"solid","yellow")))
below((rectangle(70,50,"solid","blue")),(rectangle(50,50,"outline","red")))
beside((circle(10,"solid","yellow")),(circle(10,"solid","blue")))