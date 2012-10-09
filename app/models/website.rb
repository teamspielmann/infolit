class Website < ActiveRecord::Base
  attr_accessible :least_reason, :least_reliable, :most_reason, :most_reliable, :user_id
      belongs_to :user
      validates :most_reliable, :most_reason, :least_reliable, :least_reason, :presence => true
end
