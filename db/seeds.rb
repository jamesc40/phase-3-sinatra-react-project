require 'faker'
User.all.destroy_all
Workout.all.destroy_all
Exercise.all.destroy_all

puts "🌱 Seeding spices..."

# Seed your database here
profile_img = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrsKE0n1Wa70pdYeKKIiJonNcU-fuNEV0nuw&usqp=CAU',
  'https://i.pinimg.com/originals/f6/a6/ee/f6a6ee3f5c366950db6012a0d44cc882.jpg',
  'https://www.imagediamond.com/blog/wp-content/uploads/2020/06/cartoon-girl-images.jpg',
  'https://i.pinimg.com/280x280_RS/b9/48/40/b94840cc58a8e70897332f43fe1b87ea.jpg',
  'https://i.pinimg.com/originals/88/ef/67/88ef67806917a52364093c17a28f1590.png'
]

5.times do |i|

  name = Faker::Name.first_name

  User.create(username: "#{name.downcase}#{i}",
              password: Faker::Internet.password,
              name: name,
              image: profile_img[i] 
             ) 
end

exercises = [  
  'Run',
  'Swim',
  'Weight Lift',
  'Bike',
  'Yoga',
  'Aerobic',
  'Crossfit',
  'Stretching',
  'Dancing',
  'Tennis'
]

images = [
  'https://physioyves.com/wp-content/uploads/2021/04/file-20210127-17-if809z.jpg',
  'https://www.xtremeswim.com/assets/1/6/MainFCKEditorDimension/men_crop.jpg',
  'https://www.ledleisure.co.uk/i/uploads/gallery/strength%20blog%20main%20photo.jpg',
  'https://caloriesburnedhq.com/img/biking-distance-300x300.jpg',
  'https://caffeyoga.com/wp-content/uploads/2016/01/beach-yoga1.jpg',
  'https://media.istockphoto.com/photos/group-of-friends-doing-fitness-exercises-for-legs-in-gym-in-their-picture-id1127582157?k=20&m=1127582157&s=612x612&w=0&h=SX0-SFkyzMRlfnVK8McIE_G5vnZ2tHXYJ3sahv7lVGI=',
  'https://img.freepik.com/free-photo/athletic-man-doing-crossfit-exercises-with-rope-smoky-gym_120960-2579.jpg',
  'https://thumbs.dreamstime.com/b/yoga-stretch-exercise-fit-asian-woman-stretching-lower-back-spine-health-city-outdoor-fitness-class-park-seated-spinal-154999670.jpg',
  'https://www.liveabout.com/thmb/zO_Lo7GCzHbnSEb5isTcCO5DlJ4=/1403x1403/smart/filters:no_upscale()/dance-fitness-1067009516-5c81907946e0fb0001136604.jpg',
  'https://media.istockphoto.com/photos/ready-i-will-serve-the-tennis-ball-picture-id1302802154?b=1&k=20&m=1302802154&s=170667a&w=0&h=_QL3jAqmivEm0Lk8cwtrdUPuXKx9-86BJ8X2_kc_EYE='
]


exercises.length.times do |i|

  Workout.create(workout_type: exercises[i],
                 image: images[i]
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
