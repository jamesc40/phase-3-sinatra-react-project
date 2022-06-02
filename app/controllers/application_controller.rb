require 'pry'
#enable :sessions

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  post '/login' do
    user = User.find_by(username: params[:username], 
                        password: params[:password]
                       )
    if user 
      user.to_json
    else
      status 400
      false.to_json
    end
  end

  post '/signup' do
    user = User.create(username: params[:username],
                password: params[:password],
                name: params[:name],
                image: params[:image]
               )
    user.to_json
  end

  patch '/user/:id' do
    user = User.find(params[:id])
    params.each do |key, value|
      unless key == "id"
        user.update("#{key}": value)
      end
    end
    status 200
  end

  delete '/user/:id' do
    User.find(params[:id]).destroy
  end

  get '/user/:id' do
    user = User.find(params[:id])
    exercises = user.sort_exercises
    workouts = user.workouts_for_sorted_exercises
    { user: user, 
      total_minutes: user.total_minutes, 
      total_exercises: user.total_exercises, 
      exercises: exercises, 
      workouts: workouts 
    }.to_json
    #user.exercises.order('date DESC').to_json(methods: [:workout, :user])
    #user.to_json(only: [:id, :name, :image], include: { exercises: { include: :workout } })
  end

  get '/workouts' do
    { workouts: Workout.all, 
      most_popular_workout: Workout.most_popular, 
      most_active_user: User.most_active 
    }.to_json
  end
  
  post '/exercise/new' do
    workout = Workout.find_by(workout_type: params[:workout_type])

    Exercise.create(user_id: params[:user_id], 
                    workout: workout,
                    date: params[:date],
                    difficulty: params[:difficulty],
                    duration: params[:duration]
                   )

    unless Exercise.exists?(workout: workout)   
      status 400
    end

  end

end
