class PresentTitle < ActiveRecord::Base
  attr_accessible :titlea, :bodyb, :bodyc, :bodyd, :bodye, :bodyf, :bodyg, :bodyh, :bodyi,:bodyj, :bodyk, :score, :user_id, :sum_of_body 
  belongs_to :user

end
