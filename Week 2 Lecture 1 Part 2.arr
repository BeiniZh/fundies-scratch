use context starter2024
# also put include image at the top of the code
include image

#define width

rect-width = 140

#define length

rect-length = 40

flag-before = above(rectangle(rect-width,rect-length,"solid","red"),
  rectangle(rect-width,rect-length,"solid","green"))

flag-before




#Class exercise
#Exercise 1

#define length of triangle
tri-sidelength = 35
orange-triangle = triangle(tri-sidelength,"solid","orange")
orange-triangle

#生成orange triangle也可以直接从右边输入



#Exercise 2
#Define a side length and colour (as two separate definitions), and then define a square using those names for the side length and

Sq-length = 100
Sq-color = "beige"

# beige does not equal to "beige"; we cannot write like Sq-color=beige

Sq = square(Sq-length,"solid",Sq-color)
Sq



#Exercise 3
#Now define a second version where you do not use the side length and colour variables. Notice that when you evaluate both identifiers in the interactions, they are exactly the same, but the code is easier to read with the separate definitions.

Sq2 = square(100,"solid","beige")
check "same image, different code":
  Sq is Sq2
end
#Try defining a new side length with the same variable, later in the definitions. Note what happens when you try to hit "Run". Redefining the same variable is called shadowing, and Pyret rules this out, since it is a common cause of bugs.


#Example2  of using check

area = 3 * 5

check "area is 15":
  area is 14
end

check "area is 15":
  area is 15
end



#Exercise 5
#Now define an image that has a small yellow circle on top of a larger black rectangle. Try several different ways, using different number of definitions. See which is easiest to understand.


#my solution
circle1-radius=40
circle1-color="yellow"

rectangle1-length=100
rectangle1-width=200
rectangle1-color="black"

circle1 = circle(circle1-radius,"solid",circle1-color)
rectangle1 = rectangle(rectangle1-width,rectangle1-length,"solid",rectangle1-color)

badge1=overlay((circle1),(rectangle1))

#another solution in class
badge-none =overlay(circle(15,"solid","yellow"),
  rectangle(90,60,"solid","black"))
  
#name parts, not just named numbers

check" all two images are identical":
  badge-none is badge1
end
#if we have three, then to check them is shown as below: A is B, B is C. No matter how many images there are, just follow the patterns.



#Exercise 8
#Now make a new image that puts two copies of your small yellow circle side-by-side on top of your black rectangle.

two-circles= beside((circle1),(circle1))

above((two-circles),(rectangle1))



#Exercise 9