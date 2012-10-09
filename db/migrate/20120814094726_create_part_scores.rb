class CreatePartScores < ActiveRecord::Migration
  def change
    create_table :part_scores do |t|
      t.integer :vehicle_type
      t.time :start_time
      t.time :end_time
      t.decimal :time_taken
      t.integer :searches_count , default:0
      t.integer :score
      t.integer :task_completed
      t.integer :user_id
      
      t.timestamps
    end
  end
end
