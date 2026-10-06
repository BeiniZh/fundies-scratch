use context dcic2024
include csv

#compute-sum(2 , 6)

# higher-order function, it takes a function as one of its arguments

#filter-with(function)


orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00 #index 2
  row: "11:00", 3.95 #index 3
  row: "14:00", 4.95 #index 4
  row: "16:45", 7.95
end

fun is-high-value(o :: Row) -> Boolean:
  o["amount"] >= 8.0
  #it's going to pass a complete row for this function, and returns with a boolean

where:
  is-high-value(orders.row-n(2)) is true
  #row-n is a function itself,instead of putting the action numbers.But we need to specify the row number, and it starts with 0.
  
  is-high-value(orders.row-n(4)) is false
 
end

  
fun compute-sum(first-number :: Number, second-number :: Number)
  ->Number:
  doc:"this function takes two numbers and compute their sum"
  first-number + second-number
  
where:
  compute-sum(2,3) is 5
  compute-sum(9,9) is 18
  compute-sum(4,4) is 8
end

#this function expect two values, in this function we are passing a complete table and a function

new-high-orders = filter-with(orders, is-high-value)
#这行代码的作用是从 orders 订单表中筛选出所有高价值（金额不少于 8.0）的订单，并将筛选出的新表格赋值给变量

high-value-orders=table: time, amount
  row: "08:00", 10.50
  row:"10:15", 8.00
end

check:new-high-orders is high-value-orders
end

filter-with(orders, lam(o): o["amount"] >= 8.0 end)

#order-by
order-by(orders, "amount", true)#ascending order
order-by(orders, "amount", false)#decending order