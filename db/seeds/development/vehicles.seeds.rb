5.times do
   vehicle = Vinbot::Vehicle.new
   Vehicle.create(
      make: vehicle.make,
      model: vehicle.model,
      year: rand(1963..2016),
      vin: vehicle.vin
  )
end