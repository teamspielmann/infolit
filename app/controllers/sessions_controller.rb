
class SessionsController < ApplicationController
  def new
    username = User.find_by_school_and_taken(params[:user], 0) 
       respond_to do |format|
         format.html # index.html.erb
         format.json { render json: @usernames }
    
      end
  end
  
  def create 
    username = User.find_by_school_and_taken(params[:user], 0) 


    session[:user_id] = username.id
    redirect_to edit_user_path(username)
  end 

  def destroy
    reset_session
    redirect_to root_path, :notice => "Thank you for Particpating in this study. You have now logged out."
  end


end
