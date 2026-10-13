use context dcic2024
include csv
include data-source

#Exercise 1 — Long Flights

flights = load-table:
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
  source:csv-table-file("flights.csv",default-options)
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

fun is_long_flight(row :: Row) -> Boolean:
  doc:"returns the flight as if it's a long flight according to the distance"
  row["distance"] >= 1500
end

long_flights = filter-with(flights,is_long_flight)

order-air-time = order-by(long_flights,"air_time",false)

first-row = order-air-time.row-n(0)

first-row-carrier = first-row["carrier"]
first-row-origin =  first-row["origin"]
first-row-dest =  first-row["dest"]

#Exercise 2 — Delayed Morning Flights
fun is_delayed_departure(row :: Row)->Boolean:
  doc:"determine flights that were delayed by at least 30 minutes"
  row["dep_delay"] >= 30
end

fun is_morning_sched_dep(row :: Row)->Boolean:
  doc:"checks if the scheduled departure time is before noon"
  row["sched_dep_time"] < 1200
end

delayed-and-noon = filter-with(flights, lam(o): o["dep_delay"] >= 30 end)