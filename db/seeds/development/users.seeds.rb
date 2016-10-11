testers = [
  "alisa mathewson",
  "biren talati",
  "greg spanel",
  "guy pacurar",
  "kimberly miller",
  "heather schoeneman",
  "kurt schoeneman",
  "melinda marks",
  "sarah schoeneman",
  "seemant kulleen"
]

testers.each do |fullname|
  first = fullname.split.first
  last = fullname.split.last
  last_initial = fullname.split.last.chars.first
  test_domain = "@mochil.la"
  email = first + "." + last + test_domain

  user = User.create!(
    name: fullname,
    email: email,
    password: "password",
    bio: Faker::Stoked.paragraphs(3)
  )
  # user.confirm
end


