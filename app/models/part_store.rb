class PartStore < ActiveRecord::Base
  attr_accessible :keywords, :model, :part, :store_location, :store_name
  
  def self.search(str)
    return [] if str.blank?
    cond_text   = str.split.map{|w| "store_name LIKE ? "}.join(" AND ")
    cond_values = str.split.map{|w| "%#{w}%"}
    all(:conditions =>  (str ? [cond_text, *cond_values] : []))
  end
end
