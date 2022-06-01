class Workout < ActiveRecord::Base
  has_many :exercises
  has_many :users, through: :exercises

  def self.most_popular
    Workout.all.max_by { |workout| workout.exercises.count }
  end
end
