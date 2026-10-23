use context dcic2024

#[list:2,3,4,5,6]
#[list:2] first; [3,4,5,6] and then the first will be 3 from this list, until we get empty
#This method takes the least amount of time

#|
   
   cases(List) l:
   | empty => ...# the answer for no elements
   |link (f,r)=> ...#combine f wih the answer for r
   end
   
|#

[list:1,2,3].first #1
[list:1,2,3].rest # when use rest with the list, it will exclude the first number
[list:1].rest #if there is only one element in the list,using rest will result empty

is-link([list:1,2,3].rest) #true
is-empty([list: ]) #true
is-empty([list: 3].rest) #true