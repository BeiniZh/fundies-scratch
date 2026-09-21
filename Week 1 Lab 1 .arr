use context starter2024
# T-shirt shop: 1.Calculating Cost

5 * (12 + 3)

7 * (12 + 3)

#compare two results: two expressions are with a difference of 2*(12+3)


# T-shirt shop: 2.Rectangular Poster

#perimeter= 2 * (width + height)

2 * (420 + 594)


# multiple the perimeter by 0.1 to find the cost

2028 * 0.1


# what will happen if forget parentheses around (width + height)

2 * (420 + 594)
# the * and + operations are at the same grouping level. We need to add parentheses to group the operations, and make the order of operations clear.




#String Suprises: 1.Saving a Tagline

#Type the T-shirt shop's tagline
"Designs for everyone!"
# When omit one of the quotes and the error will shows "You may be missing an "end", or closing punctuation like ")" or "]" somewhere in your program."

#String Suprises: 2.Colour Inventory

#Add colours as strings (eg.add red and blue)
"red" + "blue"

#Add both numbers and strings (eg. 1 + "blue")
"1" + "blue"

#|The left side was:1
  The right side was:"blue"
  The + operator expects to be given:two Numbers, or two Strings
|#




#3.Make a Traffic Light:1.Frame
rectangle(40,100,"solid", "black")

#3.Make a Traffic Light:2.Lights

overlay((circle(15,"solid","green")),(rectangle(40,100,"solid", "black")))
above((circle(15,"solid","yellow")),(circle(15,"solid","green"))

