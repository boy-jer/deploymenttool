class TrackersController < ApplicationController

  def index
    @campaigns = Campaign.find :all, :conditions => ["drop_date >= ?", DateTime.now], :order => 'drop_date ASC' 
  end

end
