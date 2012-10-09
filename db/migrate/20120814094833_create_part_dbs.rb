class CreatePartDbs < ActiveRecord::Migration
  def change
    create_table :part_dbs do |t|
      t.string :store_location
      t.string :store_name
      t.string :carmodel
      t.string :part
      t.string :keywords

    end
  end
end
