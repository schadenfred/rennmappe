names = %w[jud fred jake kaley]

names.each do |name|
  user = User.create!(
    name: name,
    email: "#{name}@rennmappe.de",
    password: "password"
  )
  user.confirm
end

users = User.all

org = Org.create(name: "flatsix")

org.checks.create(name: "mileage")