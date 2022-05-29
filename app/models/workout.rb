class Workout < ActiveRecord::Base
  has_many :exercises
  has_many :users, through: :exercises
end
