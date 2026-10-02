use context dcic2024

# Create a table. When we specify the order of the table, we always need to follow that. And type workouts on the right side if we want to run the code.

include csv
include data-source
workouts1 = table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
end

# we can also use check for this one.

check:
  table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
  end
    is
  table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
  end
end

#consider we have a large table of values,

workouts = table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
end

first-row = workouts.row-n(0)
first-row

#we specify first row with activity, inorder to get the duration, whatever we have at "row-n(n)", we will get that for the answer.

first-row["activity"]
workouts.row-n(1)["duration"]

#to get number of rows in workouts
workouts.length()

# to get all values in a specific column
workouts.get-column("activity")

#some basic stats
#because we cannot use the mean function to starte2024, so we need to change the context to dcic 2024

mean(workouts, "duration")
median(workouts, "duration")
sum(workouts, "duration")
stdev(workouts, "duration")
modes(workouts, "duration")

#import csv fro the url

recipes = load-table:
  #we need to specify the colmns that actually exist in the csv
  title :: String,
  servings :: Number,
  prep-time :: Number
  # If we didn't include all the rows, then we will get an error
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/recipes.csv",default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

recipes

recipes.length()

mean(recipes,"prep-time")
    
#instead of specify the csv, see lecture 2 csv file

hist-plot = histogram(recipes,"prep-time", 50)
bp = box-plot(recipes, "serving")
