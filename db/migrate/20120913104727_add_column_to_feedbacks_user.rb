class AddColumnToFeedbacksUser < ActiveRecord::Migration
  def change
    add_column :feedbacks, :user, :integer
  end
end
