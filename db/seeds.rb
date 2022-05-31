require 'faker'
User.all.destroy_all
Workout.all.destroy_all
Exercise.all.destroy_all

puts "🌱 Seeding spices..."

# Seed your database here
10.times do |i|
  name = Faker::Name.first_name
  User.create(username: "#{name.downcase}#{i}",
              password: Faker::Internet.password,
              name: name,
              image: 
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrsKE0n1Wa70pdYeKKIiJonNcU-fuNEV0nuw&usqp=CAU'
             ) 
end

exercises = ['Run', 'Swim', 'Weight Lift', 'Bike']
exercises.length.times do |i|
  Workout.create(workout_type: exercises[i],
                 image: nil
                )
end

difficulty = ['easy', 'medium', 'hard']

10.times do |i|

  length = difficulty.length
  index = rand(0..length) 

  Exercise.create(user_id: User.ids.sample,
                  workout_id: Workout.ids.sample,
                  date: Faker::Date.in_date_period,
                  duration: rand(5..60),
                  difficulty: difficulty[index]
                 )
end

puts "✅ Done seeding!"
