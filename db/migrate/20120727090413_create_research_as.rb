class CreateResearchAs < ActiveRecord::Migration
  def change
    create_table :research_as do |t|
      t.integer :score, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end
end
