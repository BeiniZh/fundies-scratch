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
# Replace missing values in tailnum with "UNKNOWN"


