class SegmentationsController < ApplicationController

  def show
    @brand = Brand.find params[:brand_id]
    @campaign = @brand.campaigns.find params[:campaign_id]
  end

end
