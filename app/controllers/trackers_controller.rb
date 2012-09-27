class TrackersController < ApplicationController

  def index
    @campaigns = Campaign.find :all, :conditions => ["drop_date >= ? and drop_date <= ?", DateTime.now, DateTime.now + 7.days], :order => 'drop_date ASC' 
  end

  def show
    @brand = Brand.find params[:id]
    @campaigns = Campaign.find :all, :conditions => ["brand_id = ? and drop_date >= ? and drop_date <= ?", params[:id], DateTime.now, DateTime.now + 7.days], :order => 'drop_date ASC' 
  end

end
