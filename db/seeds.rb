User.create!(username:  "Tran Thanh Tung",
             email: "trantube94@gmail.com",
             password:              "19101994",
             password_confirmation: "19101994",
             admin: true)
50.times do |n|
  name  = Faker::Name.name
  email = "test.aaaaa-#{n+1}@gmail.com"
  password = "abc123"
  User.create!(username: name,
              email: email,
              password:              password,
              password_confirmation: password)
end