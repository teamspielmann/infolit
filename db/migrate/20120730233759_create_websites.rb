class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.integer :most_reliable
      t.integer :most_reason
      t.integer :least_reliable
      t.integer :least_reason
      t.integer :user_id
      t.timestamps
    end
  end
end
