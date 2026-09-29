use context starter2024
# Boolean Values, it's named after the mathematician George Bool.
#Booleans only have two possibilities: True & False

check:
  true is true
  not(true) is false
end

check:
  true is true
  not(true) is false
  
  # and
  true and true is true
  false and true is false
  (4 < 5) and ((4 + 2) == 6) is true
  
  # or
  true or false is true
  false or false is false
  (4 > 5) or ("a" == "b") is false
end




#The choose-hat Function
#Doc is a very useful string for other people to use the function you have created.
fun choose-hat(
    temp-in-C :: Number) 
  -> String:
  doc:"determines appropriate heaad gear, with above 27C a sun hat, below nothing"
  if temp-in-C > 27:
    "sun hat"
    else:
    "no hat"
  end
where:
  choose-hat(25) is "no hat"
  choose-hat(35) is "sun hat"
  choose-hat(27) is "no hat"
end


#the process of fixing the error is called debugging, and we will use "spy"
fun choose-hat-spy(temp-in-C :: Number) -> String:
  doc: "determines appropriate head gear, with above 27C a sun hat, below nothing"
  spy:
    temp-in-C
  end  
  if temp-in-C > 27:
    "sun hat"
  else:
    "no hat"
  end
where:
  choose-hat-spy(25) is "no hat"
  choose-hat-spy(32) is "sun hat"
  choose-hat-spy(27) is "sun hat"
end
 

    