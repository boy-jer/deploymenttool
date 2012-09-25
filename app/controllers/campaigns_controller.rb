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
    @campaign = Campaign.find params[:id]
  end
  
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy ? redirect_to(brand_path(params[:brand_id])) : redirect_to(new_brand_path)
  end
  
  def counts
    @campaign = Campaign.find(params[:id])
    @send_list = @campaign.brand.send_lists.find(:first, :conditions => ['lower(list_name) = ?', 'counts'])
    render :layout => 'email'
  end
  
  def proof
    @campaign = Campaign.find(params[:id])
    @send_list = @campaign.brand.send_lists.find(:first, :conditions => ['lower(list_name) = ?', 'proofs'])
    render :layout => 'email'
  end
  
  def final
    @campaign = Campaign.find(params[:id])
    @send_list = @campaign.brand.send_lists.find(:first, :conditions => ['lower(list_name) = ?', 'approvals'])
    render :layout => 'email'
  end
  
  def scheduled
    @campaign = Campaign.find(params[:id])
    @send_list = @campaign.brand.send_lists.find(:first, :conditions => ['lower(list_name) = ?', 'scheduling'])
    render :layout => 'email'
  end

  def detials
  end
  
  def duplicate
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.find(params[:id]) # duplicate active record?

    # There is a vulnerability here, could post data, consider another post method.
    @campaign.name = NIL
    @campaign.drop_date = NIL
  end
  
  def create_duplicate
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.find(params[:id])
    
    @campaign = @campaign.dup

    @campaign.update_attributes(:name => params[:campaign][:name], :drop_date => params[:campaign][:drop_date])
    
    @campaign.save ? redirect_to(brand_path(@brand)) : redirect_to(brand_path(@brand))
  end

  def update
    @brand = Brand.find params[:brand_id]
    
    @campaign = @brand.campaigns.find params[:id]

    if params[:updater]
        params[:campaign] = {:scheduled => 0} if params[:campaign] == NIL
    else
        # Hack, can't get the false version to update without this. It returns nothing when submitted...
    params[:campaign] = {:counts_approval => 0} if params[:campaign] == NIL
    end
    



    @campaign.update_attributes params[:campaign]
    
    redirect_to( brand_campaign_path(@brand, @campaign) )
  end

end