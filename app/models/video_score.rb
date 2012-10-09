class VideoScore < ActiveRecord::Base
  attr_accessible :score, :searches, :start_time,  :end_time
  belongs_to :user
  attr_writer :current_step
  
  def current_step
    @current_step || steps.first
  end

  def steps
        %w[start_timer search result incorrect_result error_page]
  end
  
  def  start
    self.current_step = steps[1]
  end
  

  def last_step?
    current_step == steps.last
  end

  def result_page
    self.current_step = steps[2]
  end

  def back_to_search
    self.current_step = steps[1]
    
  end 
  
  def incorrect_result
    self.current_step = steps[3]
  end
  
  def error_page
    self.current_step = steps[4]
  end  

end
