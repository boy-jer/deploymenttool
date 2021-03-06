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
  
  def destroy
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.find params[:campaign_id]
    @version = @campaign.versions.find params[:id]
    
    @version.destroy ? redirect_to(brand_campaign_path(params[:brand_id], params[:campaign_id])) : redirect_to(new_brand_path)
  end
  
  
  
  

  def update
    @brand = Brand.find params[:brand_id]
    
    @campaign = @brand.campaigns.find params[:campaign_id]
    @version = @campaign.versions.find params[:id]

    # Hack, can't get the false version to update without this. It returns nothing when submitted...
    params[:version] = {:creative_approval => 0} if params[:version] == NIL

    @version.update_attributes params[:version]
    
    redirect_to( brand_campaign_path(@brand, @campaign) )
  end
  
  
  

end
