class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :keywords
      t.string :length
      t.string :chosen


    end
  end
end
