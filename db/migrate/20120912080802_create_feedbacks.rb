class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user
      t.decimal :define_1
      t.decimal :define_2
      t.decimal :define_3
      t.decimal :define_t
      t.decimal :access_1
      t.decimal :access_2
      t.decimal :access_3
      t.decimal :access_4
      t.decimal :access_t
      t.decimal :evaluate_1
      t.decimal :evaluate_2
      t.decimal :evaluate_3
      t.decimal :evaluate_4
      t.decimal :evaluate_t
      t.decimal :use_1
      t.decimal :use_2
      t.decimal :use_t
      t.decimal :il_total

      t.timestamps
    end
  end
end
