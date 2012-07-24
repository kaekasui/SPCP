# Fat Free CRM
# Copyright (C) 2008-2011 by Michael Dvorkin
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#------------------------------------------------------------------------------

class EventsController < ApplicationController
  before_filter :get_data_for_sidebar, :only => :index

  # GET /events
  #----------------------------------------------------------------------------
  def index
    puts 'whyyy'
    # @events = get_events(:page => params[:page])
    @events = Event.all
    respond_with(@events)
  end

  # GET /events/1
  #----------------------------------------------------------------------------
  def show
    @event = Event.find(params[:id])
    respond_with(@event) do |format|
      format.html do
        @stage = Setting.unroll(:opportunity_stage)
        @comment = Comment.new
        # @timeline = timeline(@event)
      end
    end
  end

  # GET /events/new
  # GET /events/new.json
  # GET /events/new.xml                                                 AJAX
  #----------------------------------------------------------------------------
  def new
    # @event.attributes = {:user => @current_user, :access => Setting.default_access}
    # @users = User.except(@current_user)
    @event = Event.new
    @users = User.all

    if params[:related]
      model, id = params[:related].split('_')
      if related = model.classify.constantize.my.find_by_id(id)
        instance_variable_set("@#{model}", related)
      else
        respond_to_related_not_found(model) and return
      end
    end

    respond_with(@event)
  end

  # GET /events/1/edit                                                  AJAX
  #----------------------------------------------------------------------------
  def edit
    @users = User.except(@current_user)
    if params[:previous].to_s =~ /(\d+)\z/
      @previous = Event.my.find_by_id($1) || $1.to_i
    end

    respond_with(@event)
  end

  # POST /events
  #----------------------------------------------------------------------------
  def create
    @users = User.except(@current_user)
    @comment_body = params[:comment_body]
    @event = Event.new(params[:event])
    

    respond_with(@event) do |format|
      if @event.save_with_permissions(params[:users])
        @event.add_comment_by_user(@comment_body, current_user)
        # @events = get_events
        @events = Event.all
        puts 'pooop'
        puts @event
        get_data_for_sidebar
      end
    end
  end

  # PUT /events/1
  #----------------------------------------------------------------------------
  def update
    respond_with(@event) do |format|
      if @event.update_with_permissions(params[:event], params[:users])
        get_data_for_sidebar if called_from_index_page?
      else
        @users = User.except(@current_user) # Need it to redraw [Edit Event] form.
      end
    end
  end

  # DELETE /events/1
  #----------------------------------------------------------------------------
  def destroy
    @event.destroy

    respond_with(@event) do |format|
      format.html { respond_to_destroy(:html) }
      format.js   { respond_to_destroy(:ajax) }
    end
  end

  # PUT /events/1/attach
  #----------------------------------------------------------------------------
  # Handled by EntitiesController :attach

  # PUT /events/1/discard
  #----------------------------------------------------------------------------
  # Handled by EntitiesController :discard

  # POST /events/auto_complete/query                                    AJAX
  #----------------------------------------------------------------------------
  # Handled by ApplicationController :auto_complete

  # GET /events/options                                                 AJAX
  #----------------------------------------------------------------------------
  def options
    unless params[:cancel].true?
      @per_page = @current_user.pref[:events_per_page] || Event.per_page
      @outline  = @current_user.pref[:events_outline]  || Event.outline
      @sort_by  = @current_user.pref[:events_sort_by]  || Event.sort_by
    end
  end

  # POST /events/redraw                                                 AJAX
  #----------------------------------------------------------------------------
  def redraw
    @current_user.pref[:events_per_page] = params[:per_page] if params[:per_page]
    @current_user.pref[:events_outline]  = params[:outline]  if params[:outline]
    @current_user.pref[:events_sort_by]  = Event::sort_by_map[params[:sort_by]] if params[:sort_by]
    @events = get_events(:page => 1)
    render :index
  end

  # POST /events/filter                                                 AJAX
  #----------------------------------------------------------------------------
  def filter
    session[:events_filter] = params[:status]
    @events = get_events(:page => 1)
    render :index
  end

private

  #----------------------------------------------------------------------------
  # alias :get_events :get_list_of_records

  #----------------------------------------------------------------------------
  def respond_to_destroy(method)
    if method == :ajax
      get_data_for_sidebar
      @events = get_events
      if @events.blank?
        @events = get_events(:page => current_page - 1) if current_page > 1
        render :index and return
      end
      # At this point render destroy.js.rjs
    else # :html request
      self.current_page = 1
      flash[:notice] = t(:msg_asset_deleted, @event.name)
      redirect_to events_path
    end
  end

  #----------------------------------------------------------------------------
  def get_data_for_sidebar
    puts 'hello'
    @event_status_total = { :all => Event.my.count, :other => 0 }
    Setting.event_status.each do |key|
      @event_status_total[key] = Event.my.where(:status => key.to_s).count
      @event_status_total[:other] -= @event_status_total[key]
    end
    @event_status_total[:other] += @event_status_total[:all]
  end
end
