class DemographicsController < ApplicationController

  def create
    @brand = Brand.find params[:brand_id]
    @campaign = @brand.campaigns.find params[:campaign_id]
    @version = @campaign.versions.find params[:version_id]
    @version.demographics << (Demographic.new(params[:demographic]))
    
    @version.save ? redirect_to(brand_campaign_version_path(@brand, @campaign, @version)) : NIL
  end
  
  def new
    @brand = Brand.find params[:brand_id]
    @campaign = @brand.campaigns.find params[:campaign_id]
    @version = @campaign.versions.find params[:version_id]
    @demographic = @version.demographics.new
    
    @options = Hash.new
    @brand.audiences.each { |a| @options.merge!({a.code => a.id}) }
  end

end