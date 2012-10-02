class SegmentsController < ApplicationController

  def show
    @segment = Segment.new
  end
  
  def new
    @brand = Brand.find params[:brand_id]
    @campaign = @brand.campaigns.find params[:campaign_id]
    @segment = @campaign.segments.new
  end
  
  def create
    @brand = Brand.find params[:brand_id]
    @campaign = @brand.campaigns.find params[:campaign_id]
    @segment = @campaign.segments.new params[:segment]
    
    @segment.save ? redirect_to(brand_campaign_segments_path(@brand, @campaign)) : NIL
  end
  
  def index
    @brand = Brand.find params[:brand_id]
    @campaign = @brand.campaigns.find params[:campaign_id]
    @segments = @campaign.segments
  end

end