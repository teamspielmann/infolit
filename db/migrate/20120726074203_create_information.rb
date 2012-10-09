class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :user_id
      t.string :full_name
      t.integer :form
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
