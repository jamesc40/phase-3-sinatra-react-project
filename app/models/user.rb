class User < ActiveRecord::Base
  has_many :exercises
  has_many :workouts, through: :exercises

  def self.most_active
    User.all.max_by { |user| user.exercises.count }
  end
  
  def sort_exercises
    exercises.order('date DESC')
  end

  def workouts_for_sorted_exercises
    sort_exercises.map { |exercise| exercise.workout }
  end

  def total_minutes
    exercises.sum(:duration)
  end

  def total_exercises
    exercises.count
  end
  
end

