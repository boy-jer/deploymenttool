class SendListsController < ApplicationController

  def index
    @brand = Brand.find params[:brand_id]
    @send_lists = @brand.send_lists.find :all
  end
  
  def new
    @brand = Brand.find params[:brand_id]
    @send_list = @brand.send_lists.new
  end
  
  def show
    @brand = Brand.find params[:brand_id]
    @send_list = @brand.send_lists.find params[:id]
    @send_lists_contact = @send_list.send_lists_contacts.new
    @options = Hash.new
    Contact.find(:all).each { |c| @options.merge!({c.name => c.id}) }
  end
  
  def create
    @brand = Brand.find params[:brand_id]
    @send_list = @brand.send_lists.new params[:send_list]

    @send_list.save ? redirect_to(brand_campaign_path(@brand, @campaign)) : redirect_to(new_brand_campaign_version_path)    
  end

end
