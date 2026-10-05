use context dcic2024
include csv
include data-source

#Problem 1
fun leap-year-test(
    year :: Number)
  ->Boolean:
  doc:"determine if a given year is a leap year"
  if num-remainder(year,4) == 0:
    true
    else:
    false
  end
where:
  leap-year-test(2020) is true
  leap-year-test(2021) is false
end

#Problem 2  
fun tick(
    seconds :: Number)
  ->Number:
  doc:"returns the next second,given any number between 0-59"
  if seconds == 59:
    0 
  else if (0 <= seconds) and (seconds < 59):
    seconds + 1
 
  end
  
where:
  tick(59) is 0
  tick(0) is 1
end

#Problem 3
fun rock-paper-scissors(
    p1 :: String,
    p2 :: String)
  ->String:
  doc:"return the player who win the game,or tied"
  ask:
    |(p1 == p2) then:"tie"
    |(p1 == "rock") and (p2 == "paper") then:"p2"
    |(p1 == "rock") and (p2 == "scissors") then:"p1"
    |(p1 == "paper") and (p2 == "rock") then:"p1"
    |(p1 == "paper") and (p2 == "scissors") then:"p2"
    |(p1 == "scissors") and (p2 == "paper") then:"p1"
    |(p1 == "scissors") and (p2 == "rock") then:"p2"
    |otherwise:"invalid"
  end
where:
  rock-paper-scissors("rock","paper") is "p2"
end

#Problem 4

planets = table: planet :: String, Distance :: Number
  row:"Mercury",0.39
  row:"Venus",0.72
  row:"Earth",1
  row:"Mars",1.52
  row:"Jupiter",5.2
  row:"Saturn",9.54
  row:"Uranus",19.2
  row:"Neptune",30.06
end

mars = planets.row-n(3)
planets.row-n(3)["Distance"]
mars

#Problem 5
something = load-table:
  year :: Number,
  day :: Number,
  month :: String,
  rate :: Number
  source: csv-table-file("boe_rates.csv", default-options)
    
  sanitize year using num-sanitizer
  sanitize day using num-sanitizer
  sanitize month using string-sanitizer
  sanitize rate using num-sanitizer
    
end

something.length()
median(something, "rate")
modes(something, "rate")

#this is the order of ascending order, for the first number we get will be the minimum number
order-by(something,"rate",true).row-n(0)["rate"]

#this is the order of descending order, for the first number we get will be the maximum number
order-by(something,"rate",false).row-n(0)["rate"]