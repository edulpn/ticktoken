class DashesController < ApplicationController
  # before_filter :signed_in_user

  # GET /dashes
  # GET /dashes.json
  def index
    @dashes = Dash.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dashes }
    end
  end

  # GET /dashes/1
  # GET /dashes/1.json
  def show
    @dash = Dash.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dash }
    end
  end

  # GET /dashes/new
  # GET /dashes/new.json
  def new
    @dash = Dash.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dash }
    end
  end

  # GET /dashes/1/edit
  def edit
    @dash = Dash.find(params[:id])
  end

  # POST /dashes
  # POST /dashes.json
  def create
    if (current_user.dashes.last.clock_in_out == 0)
      dash_params = {dash_at: Time.now.strftime("%d-%m-%Y %H:%M:%S"), 
        clock_in_out: 1}
    else
      dash_params = {dash_at: Time.now.strftime("%d-%m-%Y %H:%M:%S"), 
        clock_in_out: 0}
    end

    @dash = current_user.dashes.build(dash_params)

    respond_to do |format|
      if @dash.save
        format.html { redirect_to @dash, notice: 'Dash was successfully added.' }
        format.json { render json: @dash, status: :created, location: @dash }
        flash[:success] = "Dash added!"
      else
        format.html { render action: "new" }
        format.json { render json: @dash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dashes/1
  # PUT /dashes/1.json
  def update
    @dash = Dash.find(params[:id])

    respond_to do |format|
      if @dash.update_attributes(params[:dash])
        format.html { redirect_to @dash, notice: 'Dash was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashes/1
  # DELETE /dashes/1.json
  def destroy
    @dash = Dash.find(params[:id])
    @dash.destroy

    respond_to do |format|
      format.html { redirect_to dashes_url }
      format.json { head :no_content }
    end
  end
end
