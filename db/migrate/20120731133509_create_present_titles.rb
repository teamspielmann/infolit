class CreatePresentTitles < ActiveRecord::Migration
  def change
    create_table :present_titles do |t|
      t.integer :titlea
      t.integer :bodyb
      t.integer :bodyc
      t.integer :bodyd
      t.integer :bodye
      t.integer :bodyf
      t.integer :bodyg
      t.integer :bodyh
      t.integer :bodyi
      t.integer :bodyj
      t.integer :bodyk
      t.integer :sum_of_body
      t.integer :score
      t.integer :user_id
      t.timestamps
    end
  end
end
