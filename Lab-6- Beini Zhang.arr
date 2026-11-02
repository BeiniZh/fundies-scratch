use context dcic2024

# Task 1 : Expressions
#|
   the answers that i think it will return:
   
   1. 9.6
   2. Oat latte
   3. 10
|#

3 * 3.2
"Oat" + " " + "latte"
string-length("cappuccino") 


#Task 2
latte-price :: Number = 3.2
fun order-cost(d :: Number) -> Number:
  doc:"returns the cost of the order when entering the number of drinks and a price per drink"
  d * latte-price

where:
order-cost(1) is  3.2
order-cost(0) is 0
order-cost(2) is 6.4
order-cost(2) is (latte-price * 2)
end

#Task 3
fun discount-rate(nd :: Number) -> Number:
  doc:"returns 0 for fewer than 5 drinks;0.1 for 5 to 9 drinks;0.2 for 10 or more drinks"
  if nd < 5 : 0
  else if (nd >= 5) and (nd <= 9): 0.1
  else: 0.2
    
  end

where:
    discount-rate(4) is 0
    discount-rate(5) is 0.1
    discount-rate(9) is 0.1
    discount-rate(10) is 0.2
  end

#Task 4
orders = table: customer, drinks, price
  row: "Amira", 2, 3.20
  row: "Ben", 6, 2.80
  row: "Chen", 12, 3.00
  row: "Dara", 1, 3.50
end

cost-total = build-column(
  orders, "cost", lam(r): r["drinks"] * r["price"] end)

drinks-5-more = filter-with(orders, lam(r): r["drinks"] >= 5 end)

  
#Task 5
drinks-list = [list:2,6,12,1]

  fun total-drinks-loop(d :: List) -> Number block:
    var total = 0
  for each(x from d):
    total:=total + x
    end
end

  
  fun total-drinks-fold(drinks-list :: List<Number>) -> Number:
    doc:"returns total drink using fold"
  drinks-list.fold(lam(x,acc): x + acc end,0)
  end
  
  total


# Task 6 
  
  data Order:
  | eat-in(drinks :: Number)
  | takeaway(drinks :: Number, own-cup :: Boolean)
end
  
fun cup-fee (d :: Number) -> Number:
    doc:"returns the cup fee in pounds: 0.25 per drink for a takeaway without its own cup, and 0 otherwise."
  cases (Order)o:
    |eat-in(drinks)->0
    |takeaway(drinks,own-cup)->
      if own-cup is true : 0
      else: drinks * 0.25
      end
end

fun total-drinks-rec (o :: Order) -> Number:
  cases (Order)o :
    |empty -> empty
    |link(f,r) -> f * 0.25
    end
  end
  
    
  



  