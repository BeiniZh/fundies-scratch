use context dcic2024

data SensorNet:
  | hub(bandwidth :: Number, left :: SensorNet, right :: SensorNet)
  | sensor(rate :: Number)
end
# Example network
sA = sensor(60)
sB = sensor(120)
sC = sensor(45)

# You can construct larger networks like:
hub1 = hub(150, sA, sB)
core = hub(200, hub1, sC)

#Task 1 
fun total-load(n :: SensorNet) -> Number:
  doc:"using recursion that returns the total load (the sum of all sensor rates) in a network."
  cases(SensorNet) n:
    |sensor(rate) => rate
    |hub(bw,left,right) => total-load(left) + total-load(right)
  end
  
where:
  total-load(sA) is 60
  total-load(hub1) is 180
  total-load(core) is 225
end

#Task 2

fun fits-capacities(n :: SensorNet) -> Boolean:
  doc:"returns using recursion that takes a SensorNet and returns a Boolean, true if every hub's bandwidth is at least as large as the total load of its left and right sub-networks, and false otherwise."
  cases(SensorNet) n :
    |sensor(rate) => true
    |hub(bw, left, right) =>
      block:
        children-load = total-load(left) + total-load(right)
        (bw >= children-load) and fits-capacities(left) and fits-capacities(right)
      end
  end
where:
  fits-capacities(hub1) is false
  fits-capacities(hub(250, hub1, sC)) is false
end

#Task 3
fun deepest-depth(n :: SensorNet) -> Number:
  doc:"returns the depth of the deepest sensor in a given SensorNet"
cases(SensorNet)n:
  |sensor(rate) => 0
  |hub(bw, left,right) =>
      num-max(deepest-depth(left) , deepest-depth(right)) + 1
end
where:
deepest-depth(sA) is 0
deepest-depth(hub1) is 1
deepest-depth(core) is 2
end

#Task 4
fun apply-scale(n :: SensorNet, s :: Number) -> SensorNet:
  cases (SensorNet) n:
    | sensor(rate) => sensor(rate / s)
    | hub(bw, left, right) => hub(bw, apply-scale(left, s), apply-scale(right, s))
  end
where:
  total-load(apply-scale(core, 1.2)) is 187.5
end