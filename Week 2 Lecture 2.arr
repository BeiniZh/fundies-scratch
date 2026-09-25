use context starter2024

#this is what we do before
x1="Welcome to the class,Isabella"
y1="Welcome to the class,Rei"
x1
y1
#but for that, we need to write welcome to the class again and again.

#|
fun welcome(name, name1):
  ("Welcome to the class," + name) + " " + "and" + " " + name1
end
|#

x="isabella"
y="Rei"
z="Adi"

#|fun area(width,height):
  width * height
   end
  
  check:
  area(3,20) is 3 * 20
  area(4,50) is 4 * 50
end|#



#now the welcome function only contains one string,to fix this, we should put type annotations on all functions we write—both to communicate to people reading the code what type of values we expect, but also to allow Pyret to report better errors in case of mistakes. We should also indicate the type of value we are going to return!


fun welcome(name :: String) -> String:
  doc:"return a greeting addressed to given person"
  "Welcome to class," + name
end


#|The second step in our design recipe, is a "documentation string" (or docstring)
A docstring is a concise, English explanation of what the purpose of the function is
Not necessarily how it works (though the distinction is subtle), but what someone who wants to use it needs to know.
|#

#doc string the same thing, the string just stays in the function to help, but not operating purposes.And doc must be a string, not a number.

#check basicly just prove the parameter,and to see if the function works

check:
  welcome("Isabella") is "Welcome to class,Isabella"
  welcome("Rei") is "Welcome to class,Rei"
end


#If we have multiple concrete expressions that are identical except for a couple of specific data values, we create a function with the common code as follows:
armenia = frame(
  above(rectangle(120, 30, "solid", "red"),
    above(rectangle(120, 30, "solid", "blue"),
      rectangle(120, 30, "solid", "orange"))))

austria = frame(
  above(rectangle(120, 30, "solid", "red"),
    above(rectangle(120, 30, "solid", "white"),
      rectangle(120, 30, "solid", "red"))))


fun three-stripe-flag(
    top :: String,
    middle :: String,
    bottom :: String)
  -> Image:
  
  doc:"returns a flag with three stripes"
  frame(
    above(rectangle(120,30, "solid", top),
      above(rectangle(120,30, "solid", middle),
        rectangle(120,30, "solid", bottom))))
end







#Class Exercise
#|Writing Good Doc Strings
Write a doc string and add types for the following function
Take a look at some of the documentation for Pyret functions (ie Number functionsLinks to an external site.) to get a sense of how to write a clear explanation, notice how the verb "returns" is used to describe the output of a function|#

fun area(
    width :: Number, 
    height :: Number)
  -> Number:
  doc:"calculates the area of quadrilateral"
  
  width * height
end

#No matter which programming language we are using, always add a doc and annotation


#Function Design Process 1
#Total_cost = 7 * (5.00 + (string-length("Go Team!") * 0.10)
  fun total_cost(
    num_tshirts :: Number,
    shirt_string :: String) 
  ->Number:
    doc:"Calculate the price of t-shirts based in quantity and number of characters printed on it"
  num_tshirts * (5.00 + (string-length(shirt_string)  * 0.10))
end
  

  
#Function Design Process 2
fun celsius-to-fahrenheit(
    celsius :: Number)
  -> Number:
    doc:"Convert the temperture in Celsius to Fahrenheit"
  ( celsius * (9/5) ) + 32
end
  
#Function Design Process 2
fun fahrenheit-to-celsius(
    fahrenheit :: Number)
  -> Number:
  doc:"Convert the temperture in Fahrenheit to Celsius"
  ( fahrenheit - 32 ) * (5/9)
end
  
