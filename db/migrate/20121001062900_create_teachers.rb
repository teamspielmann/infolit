class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :school
      t.string :gender
      t.string :age
      t.string :subject
      t.string :comp_work
      t.string :personal_use
      t.string :professional_use
      t.text :formal_training
      t.text :informal_training
      t.text :training_needs
      t.text :other_sources_student
      t.integer :eight1
      t.integer :eight2
      t.integer :eight3
      t.integer :eight4
      t.integer :eight5
      t.integer :eight6
      t.integer :eight7
      t.integer :eight8
      t.integer :nine1
      t.integer :nine2
      t.integer :nine3
      t.integer :nine4
      t.integer :nine5
      t.integer :ten1
      t.integer :ten2
      t.integer :ten3
      t.integer :ten4
      t.integer :ten5
      t.integer :ten6
      t.integer :eleven1
      t.integer :eleven2
      t.integer :eleven3
      t.integer :eleven4
      t.integer :eleven5
      t.integer :eleven6
      
      t.timestamps
    end
  end
end
