use context starter2024

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



    