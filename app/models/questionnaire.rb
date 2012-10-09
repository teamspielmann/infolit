class Questionnaire < ActiveRecord::Base
  attr_accessible :ict_c_teacher, :ict_no_teacher, :ict_opportunities_out, :ict_opportunities_school, :internet_outside, :internet_school, :sharing_computer
  belongs_to :user
  validates  :ict_c_teacher, :ict_no_teacher, :ict_opportunities_out, :ict_opportunities_school, :internet_outside, :internet_school, :sharing_computer, :presence => true
end
