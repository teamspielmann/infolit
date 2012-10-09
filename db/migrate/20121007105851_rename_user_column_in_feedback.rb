class RenameUserColumnInFeedback < ActiveRecord::Migration
  
  def change
    rename_column :feedbacks, :user, :user_id
  end
end
