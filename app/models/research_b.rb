class ResearchB < ActiveRecord::Base
  attr_accessible :score, :user_id
  belongs_to :user
  validates :score, :presence => {:message => "^Select the most appropriate resource"}
  
end
