class FindController < ApplicationController
  before_filter :set_current_tab
  
  def index
    @equipment = Equipment.all
  end
end
