class VersionsController < ApplicationController

  def new
    @brand = Brand.find params[:brand_id]
    @campaign = @brand.campaigns.find params[:campaign_id]
    @version = @campaign.versions.new
  end
  
  def show
    @version = Version.find params[:id]
  end
  
  def index
  end
  
  def create
    @brand = Brand.find params[:brand_id]
    @campaign = @brand.campaigns.find params[:campaign_id]
    @version = @campaign.versions.new params[:version]

    @version.save ? redirect_to(brand_campaign_path(@brand, @campaign)) : redirect_to(new_brand_campaign_version_path)
  end

end
