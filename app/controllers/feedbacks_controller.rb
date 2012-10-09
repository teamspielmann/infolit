
class FeedbacksController < ApplicationController
  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedbacks }
    end
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @user=current_user
    @feedback = Feedback.find(params[:id])
    @define=@feedback.define_t.to_i
    @access=@feedback.access_t.to_i
    @evaluate=@feedback.evaluate_t.to_i
    @use=@feedback.use_t.to_i
    @total=@feedback.il_total.to_i
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedback }
    end
  end

  # GET /feedbacks/new
  # GET /feedbacks/new.json
  def new
    @user= current_user
    @feedback = Feedback.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedback }
    end
  end

  # GET /feedbacks/1/edit
  def edit
    @feedback = Feedback.find(params[:id])
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @user= current_user
    @feedback = @user.create_feedback
    
    @name= Information.find_by_user_id(@user)
    @feedback.name=@name
    @research_a = ResearchA.find_by_user_id(@user)
    @feedback.define_1= @research_a.score
    @research_b = ResearchB.find_by_user_id(@user)
    @feedback.define_2=@research_b.score
    @research_c = ResearchC.find_by_user_id(@user)
    @feedback.define_3=@research_c.score
    @feedback.define_t=@feedback.define_1+@feedback.define_2+@feedback.define_3
    
    @video_task=VideoScore.find_by_user_id(@user)
    @video_time=VideoScore.find_by_user_id(@user)
    @part_task=PartScore.find_by_user_id(@user)
    @part_time=PartScore.find_by_user_id(@user)
    @feedback.access_1=@video_task.task_completed
    @feedback.access_2=@video_time.score
    @feedback.access_3=@part_task.task_completed
    @feedback.access_4=@part_time.score
    @feedback.access_t=@feedback.access_1+@feedback.access_2+@feedback.access_3+@feedback.access_4
    
    
    @website_best=Website.find_by_user_id(@user)
    @website_best_reason=Website.find_by_user_id(@user)
    @website_least=Website.find_by_user_id(@user)
    @website_least_reason=Website.find_by_user_id(@user)
    @feedback.evaluate_1=@website_best.most_reliable
    @feedback.evaluate_2=@website_best_reason.most_reason
    @feedback.evaluate_3=@website_least.least_reliable
    @feedback.evaluate_4=@website_least_reason.least_reason
    @feedback.evaluate_t=@feedback.evaluate_1+@feedback.evaluate_2+@feedback.evaluate_3+@feedback.evaluate_4
    
    @use_1=PresentTitle.find_by_user_id(@user)
    @use_2=PresentTitle.find_by_user_id(@user)
    @feedback.use_1=@use_1.titlea
    @feedback.use_2=@use_2.score
    @feedback.use_t=@feedback.use_1+@feedback.use_2
    
    @feedback.il_total=@feedback.use_t+ @feedback.evaluate_t+@feedback.access_t+@feedback.define_t
    
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to user_feedback_path(@user, @feedback), notice: 'Feedback was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedbacks/1
  # PUT /feedbacks/1.json
  def update
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      if @feedback.update_attributes(params[:feedback])
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to feedbacks_url }
      format.json { head :no_content }
    end
  end
end
