
class RhinoController < ApplicationController
  def donate
  @user = current_user
  end

  def answers
  @user = current_user
  end

  def university
    @user = current_user
  end
end
