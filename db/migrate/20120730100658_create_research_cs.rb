class CreateResearchCs < ActiveRecord::Migration
  def change
    create_table :research_cs do |t|
      t.integer :score, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end
end
