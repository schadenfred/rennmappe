after "development:users", "development:vehicles" do

  users = User.all
  vehicles = Vehicle.all
  users.each do |user|
    user.vehicles.new
  end
end