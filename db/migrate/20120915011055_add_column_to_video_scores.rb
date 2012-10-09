class AddColumnToVideoScores < ActiveRecord::Migration
  def change
    add_column :video_scores, :refine_count, :integer, default:0
  end
end
