
class PartDbsController < ApplicationController
  # GET /part_dbs
  # GET /part_dbs.json
  def index
    @part_dbs = PartDb.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @part_dbs }
    end
  end

  # GET /part_dbs/1
  # GET /part_dbs/1.json
  def show
    @part_db = PartDb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @part_db }
    end
  end

  # GET /part_dbs/new
  # GET /part_dbs/new.json
  def new
    @part_db = PartDb.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @part_db }
    end
  end

  # GET /part_dbs/1/edit
  def edit
    @part_db = PartDb.find(params[:id])
  end

  # POST /part_dbs
  # POST /part_dbs.json
  def create
    @part_db = PartDb.new(params[:part_db])

    respond_to do |format|
      if @part_db.save
        format.html { redirect_to @part_db, notice: 'Part db was successfully created.' }
        format.json { render json: @part_db, status: :created, location: @part_db }
      else
        format.html { render action: "new" }
        format.json { render json: @part_db.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /part_dbs/1
  # PUT /part_dbs/1.json
  def update
    @part_db = PartDb.find(params[:id])

    respond_to do |format|
      if @part_db.update_attributes(params[:part_db])
        format.html { redirect_to @part_db, notice: 'Part db was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @part_db.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_dbs/1
  # DELETE /part_dbs/1.json
  def destroy
    @part_db = PartDb.find(params[:id])
    @part_db.destroy

    respond_to do |format|
      format.html { redirect_to part_dbs_url }
      format.json { head :no_content }
    end
  end
end
