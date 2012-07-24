class StartsController < ApplicationController
  before_filter :set_current_tab
  
  # GET /starts
  # GET /starts.json
  def index
    # @ = Start.all

    respond_to do |format|
      format.html # index.html.erb
      format.json 
    end
  end

  # GET /starts/1
  # GET /starts/1.json
  def show
    @start = Start.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @start }
    end
  end

  # GET /starts/new
  # GET /starts/new.json
  def new
    puts 'in the newww'
    @type = params[:event_type][:event_type_id]
    @event = Event.new
    @users = User.all
    @event_type = EventType.find(@type)
    @equipment_types = @event_type.equipment_types
    puts @equipment_types
    puts @event_type
    puts params

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @start }
    end
  end

  # GET /starts/1/edit
  def edit
    @start = Start.find(params[:id])
  end

  # POST /starts
  # POST /starts.json
  def create
    @event = Event.new(params[:start])
    puts @event

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /starts/1
  # PUT /starts/1.json
  def update
    @start = Start.find(params[:id])

    respond_to do |format|
      if @start.update_attributes(params[:start])
        format.html { redirect_to @start, notice: 'Start was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @start.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /starts/1
  # DELETE /starts/1.json
  def destroy
    @start = Start.find(params[:id])
    @start.destroy

    respond_to do |format|
      format.html { redirect_to starts_url }
      format.json { head :no_content }
    end
  end
end
