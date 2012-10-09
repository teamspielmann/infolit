class AddTakenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :taken, :integer, :default => 0
  end
end
