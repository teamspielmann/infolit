
class VideoScoresController < ApplicationController
  # GET /video_scores
  # GET /video_scores.json
  def index
    @user = current_user
    @searches = Video.search(params[:search])
    @video_scores = VideoScore.all
    
    @video_score = @user.create_video_score(params[:video_score])
    @video = Video.find_by_id(params[:searches])
    respond_to do |format|          
      format.html # index.html.erb
      format.json { render json: @video_scores }
    end
  end

  # GET /video_scores/1
  # GET /video_scores/1.json
  def show
   
    @user = current_user    
    @video_score = VideoScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video_score }
    end
  end

  # GET /video_scores/new
  # GET /video_scores/new.json
  def new
    
    @user = current_user
    @video_score = VideoScore.new

@choice = :choice #is this needed? 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video_score }
    end
  end

  # GET /video_scores/1/edit
  def edit
    @user = current_user
    @searches = Video.search(params[:search])
    @video_score = VideoScore.find(params[:id])
    @choice = session[:selected]

     respond_to do |format|
       
              format.html # show.html.erb
              format.json { render json: @video_score }
              end
       
  end

  # POST /video_scores
  # POST /video_scores.json
  def create 
      @user = current_user
      @video_score = VideoScore.new(session[:video_score]) # notice the session
      @searches = Video.search(params[:search])
      @searches_paginated=Kaminari.paginate_array(@searches).page(params[:page]).per(5)
#in order to make paginate link back p.1 (via create controller not index) change the following
#lib/kaminari/helpers/tags.rb
#def page_url_for(page)
#@template.url_for @params.merge(@param_name => (page <= 1 ? nil : page))
#end
#to
#@template.url_for @params.merge(@param_name => (page))
#see http://stackoverflow.com/questions/5488064/how-to-force-kaminari-to-always-include-page-param
#
#Also to make Kaminari html safe see 
session[:search_terms]= params[:search] #this keeps the search terms in the search field for the results page
@search_terms = session[:search_terms] 

@video_score.current_step = session[:video_score_step]
@choice = params[:choice]
@choice_integer = @choice.to_i
@start_time=session[:time_start] 
@video_submit = Video.find_by_id(@choice_integer)


if params[:start]
#@wrong_result=0
      session[:time_start] = Time.now
      @video_score.start
          render 'new'

elsif params[:choice] #this comes from the results step
            if  @choice_integer==140 #this is the correct video row in the database
                #Making the user_id result write into video_score
                @user
                @video_score_user=@user.create_video_score(params[:video_score])
                #calculating the total time to carry out search
                @video_score_user.start_time=@start_time
                @video_score_user.end_time=Time.now
                @start=@video_score_user.start_time
                @end=@video_score_user.end_time
                @video_score_user.time_taken=  @end - @start
                @time_taken=@end - @start
                  if    @time_taken<15
                        @video_score_user.score=160
                  elsif @time_taken<30
                        @video_score_user.score=140
                  elsif @time_taken<45
                        @video_score_user.score=120
                  elsif @time_taken<60
                        @video_score_user.score=100    
                  else @video_score_user.score=5000/@time_taken
                  end
                #number of times they searched
                @video_score_user.searches = session[:search_number]
                #number of time search was refined
                @video_score_user.refine_count=session[:refine_count]
                @video_score_user.task_completed=100
                #saving
                @video_score_user.save           
                redirect_to user_video_score_path(@user, @video_score_user)
            else  
                @video_submit
                @video_score.incorrect_result
                render 'new'
            end
    
    
    
    elsif params[:back_to_search]
      @video_score.back_to_search
          render 'new'
    elsif params[:search] #from the search step
            #making searches column add one for everytime new searches happpen 
            @video_score.searches = session[:search_number]
            @search_number=@video_score.searches.to_i
            @search_add_1= @search_number+1
            session[:search_number] = @search_add_1
            #@count is used to prompt error messages if the search is too broad
            @count = @searches.length
            @count_integer=@count.to_i
            @refine=session[:count] unless session[:count]==0
            session[:count]=5000 unless @refine 
            if session[:count]>@count_integer then session[:count]=@count_integer and @video_score.refine_count=session[:refine_count] 
                                                                                      @refine_count=@video_score.refine_count.to_i
                                                                                      @refine_add_1= @refine_count+1
                                                                                      session[:refine_count] = @refine_add_1
            end
          
      @video_score.result_page
          render 'new'
    elsif params[:page] #this makes the pagination routes work in the results step
          render 'new'

   elsif params[:give_up] #from the incorrect step 
       @user
          @video_score_user=@user.create_video_score(params[:video_score])
          @video_score_user.start_time=@start_time
          @video_score_user.end_time=Time.now
          @start=@video_score_user.start_time
          @end=@video_score_user.end_time
          @video_score_user.time_taken=  @end - @start
          #number of times they searched
            @video_score_user.searches = session[:search_number]
            # Wrong Answer given
             @video_score_user.task_completed=1
          #saving
              @video_score_user.save 
       redirect_to task4_path

  else @video_score.error_page
    render 'new'

end
session[:video_score_step] = @video_score.current_step

end

  # PUT /video_scores/1
  # PUT /video_scores/1.json
  def update
    @video_score = VideoScore.find(params[:id])

    respond_to do |format|
      if @video_score.update_attributes(params[:video_score])
        format.html { redirect_to @video_score, notice: 'Video score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_scores/1
  # DELETE /video_scores/1.json
  def destroy
    @video_score = VideoScore.find(params[:id])
    @video_score.destroy

    respond_to do |format|
      format.html { redirect_to video_scores_url }
      format.json { head :no_content }
    end
  end



end
