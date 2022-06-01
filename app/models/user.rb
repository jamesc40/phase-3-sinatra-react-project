class User < ActiveRecord::Base
  has_many :exercises
  has_many :workouts, through: :exercises

  def self.login(username, password)
    User.find_by(username: username).password == password ? 
      "login successful" : "invalid password"
  end

  def self.most_active
    User.all.max_by { |user| user.exercises.count }
  end
  
  #def sort_exercises
    #exercises.order('date DESC')
  #end

  #def workouts_for_sorted_exercises
    #sort_exercises.map { |exercise| exercise.workout }
  #end
  
end

