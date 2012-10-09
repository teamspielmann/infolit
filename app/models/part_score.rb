class PartScore < ActiveRecord::Base
  attr_accessible :database_choice, :end_time, :score, :searches_count, :start_time, :time_taken, :vehicle_type, :user_id
  belongs_to :user
  
  attr_writer :current_step
  
  def current_step
    @current_step || steps.first
  end

  def steps
        %w[start_timer search search_again result incorrect_result error_page]
  end
  
  def  start
    self.current_step = steps[1]
  end
  
  def search_again
    self.current_step = steps[2]
  end
  
  def result_page
    self.current_step = steps[3]
  end

  def incorrect_result
    self.current_step = steps[4]
  end

  def error_page
    self.current_step = steps[5]
  end





  def last_step?
    current_step == steps.last
  end
  

  

  
  
end
