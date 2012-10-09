class PartModel < ActiveRecord::Base
  attr_accessible :keywords, :carmodel, :part, :store_location, :store_name
    
    
    def self.search(str)
      return [] if str.blank?
      cond_text   = str.split.map{|w| "carmodel LIKE ? "}.join(" AND ")
      cond_values = str.split.map{|w| "%#{w}%"}
      all(:conditions =>  (str ? [cond_text, *cond_values] : []))
    end
end
