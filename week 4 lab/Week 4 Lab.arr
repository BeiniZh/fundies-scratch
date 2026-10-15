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

flights-distance-largerthan500 = filter-with(delayed-and-noon,lam(o):o["distance"] > 500 end)

oder-dep-delay = order-by(flights,"dep_delay",false)

worst-delay = oder-dep-delay.row-n(0)

worst-dalay-flight = worst-delay["flight"]
worst-dalay-origin = worst-delay["origin"]
worst-dalay-dep_delay = worst-delay["dep_delay"]

#| i don't know how to do the last part, but this is what i got so far:
   
worse-flight-origin-dep_delay = load table:
  flight :: string,
  origin :: string,
  dep_delay :: Number
end
|#


#Exercise 3 — Clean Delays + Compute Effective Speed
#replace the negative delay to 0

flights-negitive-zero-dep = transform-column(flights, "dep_delay", lam(d): 
    if d < 0: 0 else: d end
end)

check:
    flights-negitive-zero-dep(-10) is 0
    flights-negitive-zero-dep(5) is 5
  end


flights-negitive-zero-arr = transform-column(flights, "dep_delay", lam(a): 
    if a < 0: 0 else: a end 
end)
check:
  flights-negitive-zero-arr(-10) is 0
  flights-negitive-zero-arr(5) is 5
end

# i am not sure, why all the tests failed:(

flights-with-speed = build-column(flights-negitive-zero-arr, "effective_speed", lam(r):
    air = r["air_time"]
    distance = r["distance"]
    if air > 0:
      distance / (air / 60)
    else:
      0
    end
  end)

order-flights-with-speed = order-by(flights-with-speed,"effective_speed",false)

fastest-flight = order-flights-with-speed.row-n(0)

fastest-carrier = fastest-flight["carrier"]
fastest-origin = fastest-flight["origin"]
fastest-dest = fastest-flight["dest"]


#Exercise 4 — Discount Late Arrivals + On-Time Score

fun apply-arrival-discount(t :: Table) 
  -> Table:
  doc:"reduces arr_delay by 20% only when 0 ≤ arr_delay ≤ 45"
  transform-column(t, "arr_delay",lam(o):
      if (o >= 0) and (o <= 45):
        o * 0.8
      else:o
      end
    end)

where:
  test-table = table: arr_delay :: Number
    row: -10
    row: 0
    row: 30
    row: 60
  end
  
  actual-table = table: arr_delay :: Number
    row: -10
    row: 0
    row: 24
    row: 60
  end

  apply-arrival-discount(test-table) is actual-table
end



on-time-score = build-column(apply-arrival-discount(flights),"on_time_score1",lam(o):
    dep = o["dep_delay"]
    arr = o["arr_delay"]
    air = o["air_time"]

    dep1 = if dep < 0: 0 else: dep end
    arr1 = if arr < 0: 0 else: arr end

    score = (100 * (dep1 - arr1)) - (air / 30)
    
    if score < 0:
      0
    else:
      score
    end
  end)
 
order-on-time-score-distance = order-by(on-time-score,"distance",false)

order-flights-distance = order-by(order-on-time-score-distance,"on_time_score1",true)

top-two-flights-no1 = order-flights-distance.row-n(0)
top-two-flights-no2 = order-flights-distance.row-n(1)

top-two-flights-no1-carrier = top-two-flights-no1["carrier"]
top-two-flights-no1-flight = top-two-flights-no1["flight"]
top-two-flights-no1-origin = top-two-flights-no1["origin"]
top-two-flights-no1-dest = top-two-flights-no1["dest"]

top-two-flights-no2-carrier = top-two-flights-no2["carrier"]
top-two-flights-no2-flight = top-two-flights-no2["flight"]
top-two-flights-no2-origin = top-two-flights-no2["origin"]
top-two-flights-no2-dest = top-two-flights-no2["dest"]
