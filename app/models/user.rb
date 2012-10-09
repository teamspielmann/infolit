class User < ActiveRecord::Base
  attr_accessible :name, :school, :taken
  
  has_one :information, dependent: :destroy
  has_one :research_a, dependent: :destroy
  has_one :research_b, dependent: :destroy
  has_one :research_c, dependent: :destroy
  has_one :website, dependent: :destroy
  has_one :present_body, dependent: :destroy
  has_one :present_title, dependent: :destroy
  has_one :video_score, dependent: :destroy
  has_one :part_score, dependent: :destroy
  has_one :questionnaire, dependent: :destroy
  has_one :feedback, dependent: :destroy
end
