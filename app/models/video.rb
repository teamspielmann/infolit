class Video < ActiveRecord::Base
  attr_accessible :chosen, :description, :length, :title
  
  def self.search(str)
    return [] if str.blank?
    cond_text   = str.split.map{|w| "keywords LIKE ? "}.join(" AND ")
    cond_values = str.split.map{|w| "%#{w}%"}
    all(:conditions =>  (str ? [cond_text, *cond_values] : []))
  end
  
end
