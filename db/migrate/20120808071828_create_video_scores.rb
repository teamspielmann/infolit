class CreateVideoScores < ActiveRecord::Migration
  def change
    create_table :video_scores do |t|
      t.time    :start_time
      t.time    :end_time
      t.decimal :time_taken
      t.integer :searches, default:0
      t.integer :score
      t.integer :task_completed
      t.integer :user_id
      
      t.timestamps
    end
  end
end
