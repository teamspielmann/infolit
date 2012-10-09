
class PartScoresController < ApplicationController
  # GET /part_scores
  # GET /part_scores.json
  def index
    @part_scores = PartScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @part_scores }
    end
  end

  # GET /part_scores/1
  # GET /part_scores/1.json
  def show
    @user=current_user
    @part_score = PartScore.find(params[:id])
    @right_wrong=@part_score.task_completed
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @part_score }
    end
  end

  # GET /part_scores/new
  # GET /part_scores/new.json
  def new
    @user=current_user
    @part_score = PartScore.new
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @part_score }
    end
  end

  # GET /part_scores/1/edit
  def edit
    @part_score = PartScore.find(params[:id])
  end

  # POST /part_scores
  # POST /part_scores.json
  
  #in order to make paginate link back p.1 (via create controller not index) change the following
  #lib/kaminari/helpers/tags.rb
  #def page_url_for(page)
  #@template.url_for @params.merge(@param_name => (page <= 1 ? nil : page))
  #end
  #to
  #@template.url_for @params.merge(@param_name => (page))
  #see http://stackoverflow.com/questions/5488064/how-to-force-kaminari-to-always-include-page-param
  #
  #Also to make Kaminari html safe add.html_safe to page_entries_info
  def create
    @user=current_user
    @part_score = PartScore.new(params[:part_score])
    @vehicle_type = params[:vehicle_type]
    @vehicle_type_i =@vehicle_type.to_i
    session[:vehicle]=@vehicle_type_i#sets the default value of the select menus (from previous screen)
    @vehicle=session[:vehicle]#sets the default value of the select menus (from previous screen)
    
    
    @database_choice = params[:database_choice]
    @database_choice_i = @database_choice.to_i
    session[:database_choice]=@database_choice_i#sets the default value of the select menus (from previous screen)
    @dbchoice=session[:database_choice]#sets the default value of the select menus (from previous screen)
    
    session[:search_terms]= params[:search]
    @search_terms = session[:search_terms] 
    
    @choice = params[:choice]
    @choice_integer = @choice.to_i
        
    @wrong_result=session[:wrong_result].to_i
    
    if params[:start]
          @wrong_result=0
          session[:time_start] = Time.now
          @part_score.start
              render 'new'
   elsif params[:choice]
            if  @choice_integer==2296
                @part_score_user=@user.create_part_score(params[:part_score])
                #calculating the total time to carry out search and score
                @part_score_user.start_time=session[:time_start]
                @part_score_user.end_time=Time.now
                @start=@part_score_user.start_time
                @end=@part_score_user.end_time
                @part_score_user.time_taken=  @end - @start
                @time_taken=@end - @start
                  if    @time_taken<15
                        @part_score_user.score=160
                  elsif @time_taken<30
                        @part_score_user.score=140
                  elsif @time_taken<45
                        @part_score_user.score=120
                  elsif @time_taken<60
                        @part_score_user.score=100    
                  else @part_score_user.score=5000/@time_taken
                  end
                #number of times they searched
                @searcha=session[:search_number_store].to_i
                @searchb=session[:search_number_db].to_i
                @searchc=session[:search_number_model].to_i
                @part_score_user.searches_count=[@searcha, @searchb, @searchc].sum
                # input -20 if they search on wrong vehicle
                @part_score_user.vehicle_type=session[:vehicle_type]
                #number of time search was refined
                @part_score_user.refine_count=session[:refine_count]
                # right Answer given
                 @part_score_user.task_completed=100
                #saving
                @part_score_user.save           
                redirect_to user_part_score_path(@user, @part_score_user)
          else  @part_submit = PartDb.find_by_id(@choice_integer)
                @part_score.incorrect_result
                render 'new'
            end          

    elsif @vehicle_type_i==-20
          @wrong_vehicle = "Try a different Make of car"
          session[:vehicle_type]=@vehicle_type_i
          @part_score.search_again   
              render 'new'  
    elsif @vehicle_type_i==-21
          @wrong_vehicle = "Try a different Make of car"
          session[:vehicle_type]=@vehicle_type_i+1
          @part_score.search_again   
                      render 'new'
    elsif @vehicle_type_i==2
          @wrong_vehicle = "Try a different Make of car"
          @part_score.search_again   
                      render 'new'
    elsif @vehicle_type_i==1      
              if   @database_choice_i==0 
                   @select_db_message = "Please select a column to search on"
                   @part_score.search_again  
                      render 'new' 
              elsif @database_choice_i==1
                    @searches = PartStore.search(params[:search])
                    @count=@searches.length
                    @count_integer=@count.to_i
                    @searches_paginated=Kaminari.paginate_array(@searches).page(params[:page]).per(20)
                    #counting the number of searches 
                    @part_score.searches_count = session[:search_number_store]
                    @search_number=@part_score.searches_count.to_i
                    @search_add_1= @search_number+1
                    session[:search_number_store] = @search_add_1
                    session[:result_error_page]=@searches
                    #checking if the search has been refined
                    @refine=session[:count] unless session[:count]==0
                    session[:count]=5000 unless @refine 
                    if session[:count]>@count_integer then session[:count]=@count_integer and @part_score.refine_count=session[:refine_count] 
                                                                                              @refine_count=@part_score.refine_count.to_i
                                                                                              @refine_add_1= @refine_count+1
                                                                                              session[:refine_count] = @refine_add_1
                    end
                    @part_score.result_page
                      render 'new' 
              elsif @database_choice_i==2
                    @searches = PartDb.search(params[:search])
                    @count=@searches.length
                    @count_integer=@count.to_i
                    @searches_paginated=Kaminari.paginate_array(@searches).page(params[:page]).per(20)
                    #counting the number of searches 
                    @part_score.searches_count = session[:search_number_db]
                    @search_number=@part_score.searches_count.to_i
                    @search_add_1= @search_number+1
                    session[:search_number_db] = @search_add_1
                    session[:result_error_page]=@searches
                    #checking if the search has been refined
                     @refine=session[:count] unless session[:count]==0
                      session[:count]=5000 unless @refine 
                      if session[:count]>@count_integer then session[:count]=@count_integer and @part_score.refine_count=session[:refine_count] 
                                                                                                @refine_count=@part_score.refine_count.to_i
                                                                                                @refine_add_1= @refine_count+1
                                                                                                session[:refine_count] = @refine_add_1
                      end
                    
                    
                    @part_score.result_page
                      render 'new'
            
              elsif @database_choice_i==3
                    @searches = PartModel.search(params[:search])
                    @count=@searches.length
                    @count_integer=@count.to_i
                    @searches_paginated=Kaminari.paginate_array(@searches).page(params[:page]).per(20)
                    #counting the number of searches 
                    @part_score.searches_count = session[:search_number_model]
                    @search_number=@part_score.searches_count.to_i
                    @search_add_1= @search_number+1
                    session[:search_number_model] = @search_add_1
                    session[:result_error_page]=@searches
                    #checking if the search has been refined
                     @refine=session[:count] unless session[:count]==0
                      session[:count]=5000 unless @refine 
                      if session[:count]>@count_integer then session[:count]=@count_integer and @part_score.refine_count=session[:refine_count] 
                                                                                                @refine_count=@part_score.refine_count.to_i
                                                                                                @refine_add_1= @refine_count+1
                                                                                                session[:refine_count] = @refine_add_1
                      end
                    
                    @part_score.result_page
                      render 'new'
              end
    elsif params[:back_to_search] #this is use on _incorrect page to return to search.
          session[:wrong_result]=@wrong_result.to_i+1
          @part_score.search_again
            render 'new'
    elsif params[:give_up] #from the incorrect step 
          @user
          @part_score_user=@user.create_part_score(params[:part_score])
          #calculating the total time to carry out search
          @part_score_user.start_time=session[:time_start]
          @part_score_user.end_time=Time.now
          @start=@part_score_user.start_time
          @end=@part_score_user.end_time
          @part_score_user.time_taken=  @end - @start
          @part_score_user.score=0
               #number of times they searched
                @searcha=session[:search_number_store].to_i
                @searchb=session[:search_number_db].to_i
                @searchc=session[:search_number_model].to_i
                @part_score_user.searches_count=[@searcha, @searchb, @searchc ].sum
         # Wrong Answer given
         @part_score_user.task_completed=1
         #saving
             @part_score_user.save           
             redirect_to user_part_score_path(@user, @part_score_user)

    else @part_score.error_page # this should have bcome redundant (impossible to navigate to)
          @searches=session[:result_error_page]
          @searches_paginated=Kaminari.paginate_array(@searches).page(params[:page]).per(20)
          
            render 'new'
    end

  end
  

  # PUT /part_scores/1
  # PUT /part_scores/1.json
  def update
    @part_score = PartScore.find(params[:id])

    respond_to do |format|
      if @part_score.update_attributes(params[:part_score])
        format.html { redirect_to @part_score, notice: 'Part score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @part_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_scores/1
  # DELETE /part_scores/1.json
  def destroy
    @part_score = PartScore.find(params[:id])
    @part_score.destroy

    respond_to do |format|
      format.html { redirect_to part_scores_url }
      format.json { head :no_content }
    end
  end
end
