
class PresentIntroController < ApplicationController
  def present
       @user = current_user
  end
end
