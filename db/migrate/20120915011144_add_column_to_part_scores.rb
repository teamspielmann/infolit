class AddColumnToPartScores < ActiveRecord::Migration
  def change
    add_column :part_scores, :refine_count, :integer, default:0
  end
end
