5.times do
  @user = User.create({email: Faker::Name.first_name+'@example.com', password: '12345'})
end
