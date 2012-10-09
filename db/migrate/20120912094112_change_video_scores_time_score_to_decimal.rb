class ChangeVideoScoresTimeScoreToDecimal < ActiveRecord::Migration
  def up
    change_column :video_scores, :score, :decimal 
  end

  def down
  raise ActiveRecord::IrreversibleMigration
  end
end
