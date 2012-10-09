class CreatePartModels < ActiveRecord::Migration
  def change
    create_table :part_models do |t|
      t.string :store_location
      t.string :store_name
      t.string :carmodel
      t.string :part
      t.string :keywords

    end
  end
end
