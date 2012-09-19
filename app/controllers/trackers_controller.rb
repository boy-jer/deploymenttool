class TrackersController < ApplicationController

  def index
    @campaigns = Campaign.find :all, :conditions => ["drop_date >= ?", Date.today], :order => 'drop_date ASC'  
  end

end
