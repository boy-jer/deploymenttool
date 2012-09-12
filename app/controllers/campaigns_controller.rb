class CampaignsController < ApplicationController

  def new
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.build
  end
  
  def create
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.new(params[:campaign])
    
    @campaign.save ? redirect_to(brand_path(@brand)) : NIL
  end
  
  def show
    @campaign = Campaign.find(params[:id])
  end
  
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy ? redirect_to(brand_path(params[:brand_id])) : redirect_to(new_brand_path)
  end
  
  def counts
    @campaign = Campaign.find(params[:id])
  end
  
  def proof
    @campaign = Campaign.find(params[:id])
  end
  
  def final
    @campaign = Campaign.find(params[:id])
  end
  
  def scheduled
  end
  
  def detials
  end
  
  def duplicate
  end

end