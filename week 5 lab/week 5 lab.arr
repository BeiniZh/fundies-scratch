use context dcic2024
include csv
include data-source


# Task 1

#|
   Problem 1: There are missing values in column Tailnum.
   Planned Step: Clean the Tailnum column by replacing all the missing values to UNKNOWN.
   Implementation: Use the transform-column with a lambda expression to substitute the missing value with UNKOWN.
   
|#

#|
   Problem 2: There are negeative numbers for dep_delay and arr_delay, but those do not indicate delays.
   Planned Step: Clean the delays that are not necessarily delays, i will clean the column and eliminate the fake delays to 0, indicating not delayed.
   Implementation:  Use the transform-column, detect the values if they are smaller or equal to 0, if yes then substitute the values to 0, if no just keep the values.
   
|#

#|
   Problem 3: 
   1.The information of the same flight are seperated, and hard to see.
   2.The dep_time is not in regualr format, it's mot easy to decipher.
   Planned Step: 
   1. Clean the columns to combine them together in order to them easier to check all the essential infomation at one time.
   2.Change the formating of the expression of the time.Make it in a format of HH:MM.
   Implementation:
   1.Build a column using build-column with a lam function insider to combine the columns: flight,carrier,dep_time.
   2.Write a helper function that divide a number like 517 by 100 separates the hours (5) from the minutes (17).
   
|#



# Task 2
# load table
flights53 = load-table:
  rownames :: Number,
  dep_time :: Number,
  sched_dep_time :: Number,
  dep_delay :: Number,
  arr_time :: Number,
  sched_arr_time :: Number,
  arr_delay :: Number,
  carrier :: String,
  flight :: String,
  tailnum :: String,
  origin :: Stirng,
  dest :: String,
  air_time :: Number,
  distance :: Number,
  hour :: Number,
  minute :: Number,
  time_hour :: String
  source:csv-table-file("flights_sample53.csv",default-options)
  sanitize rownames using num-sanitizer
  sanitize dep_time using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize arr_time using num-sanitizer
  sanitize sched_arr_time using num-sanitizer
  sanitize arr_delay using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
end

#|
   1.Replace missing values in tailnum with "UNKNOWN"
|#
    
fix-tailnum =
  lam(t):
    if t == "" : "UNKNOWN"
    else: t
    end
    end
  check:
  fix-tailnum("") is "UNKNOWN"
  fix-tailnum("Hello") is "Hello"
  end

tailnum-fixed = transform-column(flights53,"tailnum",fix-tailnum)

#|
   replace negative values
|#
replace-negative-dep-arr =
  lam(d):
    if d < 0 : 0
    else: d
    end
  end
check:
  replace-negative-dep-arr(-5) is 0
  replace-negative-dep-arr(0) is 0
  replace-negative-dep-arr(5) is 5
end

negative-arr-replaced = transform-column(flights53,"dep_delay",replace-negative-dep-arr)

negative-dep-replaced = transform-column(flights53,"arr_delay",replace-negative-dep-arr)



#Identify Duplicate Rows from the Table
# Not sure how to do ths question, in order to let the code works, i will put all those codes in note.

#|
flight-string = num-to-string(row.flight)
# Trim spaces at both ends

fun trim(s :: String) -> String:
  doc: "Remove spaces from the given string."
  n = string-length(s)
  if n == 0:
    ""
  else:
    string-replace(s, " ", "")
  end
end

#converting it to uppercase for consistency
Upp-C = string-to-upper(trim.row("carrier"))

#Normalise departure times
#|
   i don't know how to do this part
   hour = flights-53.row(dep_time) / 100
   min = flights-53.row(dep_time)
   
|#

flights_key = build-column(flights-53, "dedup_key", lam(row):
    f-string = num-to-string(row.flights-53)
    c-string = string-to-upper(trim(row.carrier))
    time-string = row.dep_time
    
    string-append(string-append(string-append(string-append(f-string, "-"), c-string), "-"), time-string)
  end)
|#


# Task 4
bar-chart(flights53, "carrier")
histogram(flights53, "distance")
scatter-plot(flights53, "air_time", "distance")

distance-list = flights53.get-column("distance")

var total-distance = 0
var max-distance = 0

for each(d from distance-list):
  block:
  total-distance := total-distance + d
  when d > max-distance: max-distance := d
  end
  end
end


avg-distance = total-distance / length(distance-list)