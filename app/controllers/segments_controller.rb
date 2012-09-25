class SegmentsController < ApplicationController

  def show
    @segment = Segment.new
  end
  
  def new
    @brand = Brand.find params[:brand_id]
    @campaign = @brand.campaigns.find params[:campaign_id]
    @demographic = @version.segment.demographics.new
    
    @options = Hash.new
    @brand.audiences.each { |a| @options.merge!({a.code => a.id}) }
    
    @segment = Segment.new
  end
  
  def create
  
  end
  
  def index
    @brand = Brand.find params[:brand_id]
    @campaign = @brand.campaigns.find params[:campaign_id]
    @segment = @campaign.segment
  end

end