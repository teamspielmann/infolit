
class PresentTitlesController < ApplicationController
  # GET /present_titles
  # GET /present_titles.json
 
 def title
    @user = current_user
     @present_title = PresentTitle.find(params[:id])
     @titlea = @present_title.titlea
 @title= if @titlea==10 then "Information about Rhinos and their Habitats"
   elsif  @titlea==30 then "Factors that have caused Rhinos to become an Endangered Species" 
   elsif @titlea==5 then "Rhinos need to be saved"
     end
     @bodybb =  @present_title.bodyb
@bodyb= if @bodybb==1 then "Rhinos are endangered becauseof Human activities" end
@bodyc= if @present_title.bodyc==1 then "Rhinos are endangered becauseof Human activities" end  
     respond_to do |format|
       format.html # title.html.erb
 end
 end
 
  def index
    @present_titles = PresentTitle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @present_titles }
    end
  end

  # GET /present_titles/1
  # GET /present_titles/1.json
  def show
    @user = current_user
    @present_title = PresentTitle.find(params[:id])
    @titlea = @present_title.titlea
@title= if @titlea==10 then "Information about Rhinos and their Habitats"
  elsif  @titlea==30 then "Factors that have caused Rhinos to become an Endangered Species" 
  elsif @titlea==5 then "Rhinos need to be saved"
    end
    
 if @present_title.bodyb==1 then @bodyb="Rhinos are endangered becauseof Human activities" and @scoreb=30 else @scoreb=0 end    
if @present_title.bodyc==1 then @bodyc= "Jambiya daggers are from Yemen" and @scorec=0 else @scorec=0 end  
if @present_title.bodyd==1 then @bodyd= "Poachers are bad people" and @scored=0 else @scored=0 end  
 if @present_title.bodye==1 then @bodye= "Rhino horn is frequently used in Chinese medicine" and @scoree=30 else @scoree=0 end  
 if @present_title.bodyf==1 then @bodyf= "Chinese Traditional Medicine is practiced extensively in Asia" and @scoref=5 else @scoref=0 end  
if @present_title.bodyg==1 then @bodyg=  "Black Rhinos are actually grey in colour" and @scoreg=5 else @scoreg=0 end  
if @present_title.bodyh==1 then @bodyh= "Hong Kong banned imports of Rhino horn in 1979" and @scoreh=5 else @scoreh=0 end  
 if @present_title.bodyi==1 then @bodyi="Political conflict itself does not kill Rhinos" and @scorei=20 else @scorei=0 end  
 if @present_title.bodyj==1 then @bodyj= "Rhinos are herbivores" and @scorej=5 else @scorej=0 end  
 if @present_title.bodyk==1 then @bodyk="Rhinos are threatened by a loss of habitat" and @scorek=30 else @scorek=0 end  
  @sum= [@present_title.bodyb, @present_title.bodyc, @present_title.bodyd,@present_title.bodye, @present_title.bodyf, @present_title.bodyg,@present_title.bodyh, @present_title.bodyi, @present_title.bodyj, @present_title.bodyk ].sum 
  @score=[@scoreb, @scorec, @scored, @scoree, @scoref, @scoreg, @scoreh, @scorei, @scorej, @scorek].sum
  @present_title.score=@score
  @present_title.save  
  
#working out score for body choices and title
#@present_title.score=

    respond_to do |format|
      if @sum > 3 
        session[:wrong_number]='You have selected too many points please select only 3 Main points.'
        format.html { redirect_to  edit_user_present_title_path(@user, @present_title) }
        format.json { render json: @present_title, status: :created, location: @present_title }
      elsif   @sum < 3 
         session[:wrong_number]= 'You have not selected enough points please select 3 Main points.' 
          format.html { redirect_to  edit_user_present_title_path(@user, @present_title) }
          format.json { render json: @present_title, status: :created, location: @present_title }
      else

        format.html 
        format.json { render json: @present_title}
       end 
    end
  end

  # GET /present_titles/new
  # GET /present_titles/new.json
  def new
    @user = current_user
    @present_title = PresentTitle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @present_title }
    end
  end

  # GET /present_titles/1/edit
  def edit
        @user = current_user
    @present_title = PresentTitle.find(params[:id])
        @titlea = @present_title.titlea
    @title= if @titlea==10 then "Information about Rhinos and their Habitats"
      elsif  @titlea==30 then "Factors that have caused Rhinos to become an Endangered Species" 
      elsif @titlea==5 then "Rhinos need to be saved"
      end
        
#if :bodyb then @scoreb=30 else @scoreb=0 end    
#if :bodyc then @scorec=0 else @scorec=0 end  
#if :bodyd then @scored=0 else @scored=0 end  
#if :bodye then @scoree=30 else @scoree=0 end  
#if :bodyf then @scoref=5 else @scoref=0 end  
#if :bodyg then @scoreg=5 else @scoreg=0 end  
#if :bodyh then @scoreh=5 else @scoreh=0 end  
#if :bodyi then @scorei=20 else @scorei=0 end  
#if :bodyj then @scorej=5 else @scorej=0 end  
#if :bodyk then @scorek=30 else @scorek=0 end  
#@score=[@scoreb,@scorec,@scored,@scoree,@scoref,@scoreg,@scoreh,@scorei,@scorej,@scorek].sum
#session[:score]=@score
#@present_title.score=@score        
        @wrong_number=session[:wrong_number]
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @present_title }
        end
            
  end

  # POST /present_titles
  # POST /present_titles.json
  def create
    @user = current_user
    @present_title = @user.create_present_title(params[:present_title])
     respond_to do |format|
      if @present_title.save
        format.html { redirect_to  edit_user_present_title_path(@user, @present_title) }
        format.json { render json: @present_title, location: @present_title }
      else
        format.html { render action: "new" }
        format.json { render json: @present_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /present_titles/1
  # PUT /present_titles/1.json
  def update
    @user= current_user
    @present_title = PresentTitle.find(params[:id])

    respond_to do |format|
      if @present_title.update_attributes(params[:present_title])       
        format.html { redirect_to user_present_title_path(@user, @present_title) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @present_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /present_titles/1
  # DELETE /present_titles/1.json
  def destroy
    @present_title = PresentTitle.find(params[:id])
    @present_title.destroy

    respond_to do |format|
      format.html { redirect_to present_titles_url }
      format.json { head :no_content }
    end
  end
end
