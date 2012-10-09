
class ResearchCsController < ApplicationController
  # GET /research_cs
  # GET /research_cs.json
  def index
    @research_cs = ResearchC.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @research_cs }
    end
  end

  # GET /research_cs/1
  # GET /research_cs/1.json
  def show
    @research_c = ResearchC.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @research_c }
    end
  end

  # GET /research_cs/new
  # GET /research_cs/new.json
  def new
         @user = current_user
    @research_c = ResearchC.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @research_c }
    end
  end

  # GET /research_cs/1/edit
  def edit
    @research_c = ResearchC.find(params[:id])
  end

  # POST /research_cs
  # POST /research_cs.json
  def create
   
      @user = current_user
      @research_c = @user.create_research_c(params[:research_c])

    respond_to do |format|
      if @research_c.save
        format.html { redirect_to  task2_path, notice: 'Research c was successfully created.' }
        format.json { render json: @research_c, status: :created, location: @research_c }
      else
        format.html { render action: "new" }
        format.json { render json: @research_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /research_cs/1
  # PUT /research_cs/1.json
  def update
    @research_c = ResearchC.find(params[:id])

    respond_to do |format|
      if @research_c.update_attributes(params[:research_c])
        format.html { redirect_to @research_c, notice: 'Research c was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @research_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_cs/1
  # DELETE /research_cs/1.json
  def destroy
    @research_c = ResearchC.find(params[:id])
    @research_c.destroy

    respond_to do |format|
      format.html { redirect_to research_cs_url }
      format.json { head :no_content }
    end
  end
end
