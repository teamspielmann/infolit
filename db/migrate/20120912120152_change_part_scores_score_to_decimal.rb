class ChangePartScoresScoreToDecimal < ActiveRecord::Migration
  def up
  change_column :part_scores, :score, :decimal
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
