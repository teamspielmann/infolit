
class ResearchBsController < ApplicationController
  # GET /research_bs
  # GET /research_bs.json
  def index
    @research_bs = ResearchB.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @research_bs }
    end
  end

  # GET /research_bs/1
  # GET /research_bs/1.json
  def show
    @research_b = ResearchB.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @research_b }
    end
  end

  # GET /research_bs/new
  # GET /research_bs/new.json
  def new
        @user = current_user
    @research_b = ResearchB.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @research_b }
    end
  end

  # GET /research_bs/1/edit
  def edit
    @research_b = ResearchB.find(params[:id])
  end

  # POST /research_bs
  # POST /research_bs.json
  def create
      @user = current_user
      @research_b = @user.create_research_b(params[:research_b])

    respond_to do |format|
      if @research_b.save
        format.html { redirect_to  new_user_research_c_path(@user), notice: 'Research b was successfully created.' }
        format.json { render json: @research_b, status: :created, location: @research_b }
      else
        format.html { render action: "new" }
        format.json { render json: @research_b.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /research_bs/1
  # PUT /research_bs/1.json
  def update
    @research_b = ResearchB.find(params[:id])

    respond_to do |format|
      if @research_b.update_attributes(params[:research_b])
        format.html { redirect_to @research_b, notice: 'Research b was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @research_b.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_bs/1
  # DELETE /research_bs/1.json
  def destroy
    @research_b = ResearchB.find(params[:id])
    @research_b.destroy

    respond_to do |format|
      format.html { redirect_to research_bs_url }
      format.json { head :no_content }
    end
  end
end
