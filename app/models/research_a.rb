class ResearchA < ActiveRecord::Base
  attr_accessible :score, :user_id
  belongs_to :user
  validates :score, :presence => {:message => "Select the best Reseach Question"}
end
