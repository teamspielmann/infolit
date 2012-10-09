class Feedback < ActiveRecord::Base
  attr_accessible :user_id, :name, :access_1, :access_2, :access_3, :access_4, :access_t, :define_1, :define_2, :define_3, :define_t, :evaluate_1, :evaluate_2, :evaluate_3, :evaluate_4, :evaluate_t, :il_total, :use_1, :use_2, :use_t
  belongs_to :user
  

end

