class ResearchC < ActiveRecord::Base
  attr_accessible :score, :user_id
    belongs_to :user
    validates :score, :presence => {:message => "^Select the primary source"}
    
end
