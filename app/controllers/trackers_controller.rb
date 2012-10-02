class TrackersController < ApplicationController

  def index
    @campaigns = Campaign.find :all, :conditions => ["drop_date >= ? and drop_date <= ?", DateTime.now, DateTime.now + 7.days], :order => 'drop_date ASC' 
  end

  def show
    @brand = Brand.find params[:id]
    @campaigns = Campaign.find :all, :conditions => ["brand_id = ? and drop_date >= ? and drop_date <= ?", params[:id], DateTime.now, DateTime.now + 7.days], :order => 'drop_date ASC' 
  end

  def search
    @campaigns = Campaign.find :all, :joins => [:brand], :conditions => ["campaigns.name LIKE ? OR brands.name LIKE ? AND campaigns.drop_date >= ? AND campaigns.drop_date <= ?", "%#{params[:user_input]}%", "%#{params[:user_input]}%", DateTime.now, DateTime.now + 7.days]


    @campaigns = Campaign.find :all, :conditions => ["drop_date >= ? and drop_date <= ?", DateTime.now, DateTime.now + 7.days], :order => 'drop_date ASC'  if (params[:user_input].size < 2 || params[:user_input].size == 0)


    render :layout => false
  end

end
