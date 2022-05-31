class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.integer :user_id
      t.integer :workout_id
      t.integer :duration
      t.date :date 
      t.string :difficulty
    end
  end
end
