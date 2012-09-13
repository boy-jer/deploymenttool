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
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.find(params[:id]) # duplicate active record?

    # There is a vulnerability here, could post data, consider another post method.
    @campaign.name = NIL
    @campaign.drop_date = NIL
    @campaign.round = 0
    @campaign.counts_approval = FALSE
    @campaign.scheduled = FALSE
  end
  
  def create_duplicate
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.find(params[:id]) # duplicate active record?
    @campaign.name = params[:name]
    @campaign.drop_date = params[:drop_date]
  end

end