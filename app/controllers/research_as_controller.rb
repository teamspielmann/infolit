
class ResearchAsController < ApplicationController
  # GET /research_as
  # GET /research_as.json
  def index
    @user = current_user
    @research_as = ResearchA.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @research_as }
    end
  end

  # GET /research_as/1
  # GET /research_as/1.json
  def show
    @user = current_user
    @research_a = ResearchA.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @research_a }
    end
  end

  # GET /research_as/new
  # GET /research_as/new.json
  def new
    @user = current_user
    @research_a = ResearchA.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @research_a }
    end
  end

  # GET /research_as/1/edit
  def edit
    @research_a = ResearchA.find(params[:id])
  end

  # POST /research_as
  # POST /research_as.json
  def create
    @user = current_user
    @research_a = @user.create_research_a(params[:research_a])

    respond_to do |format|
      if @research_a.save
        format.html { redirect_to   new_user_research_b_path(@user) , notice: 'Research a was successfully created.' }
        format.json { render json: @research_a, status: :created, location: @research_a }
      else
        format.html { render action: "new" }
        format.json { render json: @research_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /research_as/1
  # PUT /research_as/1.json
  def update
    @research_a = ResearchA.find(params[:id])

    respond_to do |format|
      if @research_a.update_attributes(params[:research_a])
        format.html { redirect_to @research_a, notice: 'Research a was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @research_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_as/1
  # DELETE /research_as/1.json
  def destroy
    @research_a = ResearchA.find(params[:id])
    @research_a.destroy

    respond_to do |format|
      format.html { redirect_to research_as_url }
      format.json { head :no_content }
    end
  end
end
