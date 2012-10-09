class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.integer :ict_c_teacher
      t.integer :ict_no_teacher
      t.integer :internet_school
      t.integer :internet_outside
      t.integer :sharing_computer
      t.text :ict_opportunities_school
      t.text :ict_opportunities_out
      t.integer :user_id

      t.timestamps
    end
  end
end
