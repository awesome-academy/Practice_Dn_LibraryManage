User.create!(name: "Example User",
email: "abc@gmail.com",
password:"123",
password_confirmation: "123",
role:1,
activated: true,
activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "abc-#{n+1}@gmail.com"
  password = "password"
  User.create!(name: name,
    email: email,
    password:password,
    password_confirmation: password,
    activated: true,
    role:2,
    activated_at: Time.zone.now)
end
