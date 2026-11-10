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

