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
              name: name
             ) 
end

exercises = ['Run', 'Swim', 'Weight Lift', 'Bike']
exercises.length.times do |i|
  Workout.create(workout_type: exercises[i])
end

10.times do |i|
  Exercise.create(user_id: User.ids.sample,
                  workout_id: Workout.ids.sample,
                  duration: rand(5..60)
                 )
end

puts "✅ Done seeding!"
