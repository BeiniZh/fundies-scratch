use context starter2024

# Create a table. When we specify the order of the table, we always need to follow that. And type workouts on the right side if we want to run the code.

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