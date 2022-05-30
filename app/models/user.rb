class User < ActiveRecord::Base
  has_many :exercises
  has_many :workouts, through: :exercises

  def self.login(username, password)
    User.find_by(username: username).password == password ? 
      "login successful" : "invalid password"
  end
end

