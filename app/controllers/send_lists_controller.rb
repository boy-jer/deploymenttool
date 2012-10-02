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
  end
  
  def create
    @brand = Brand.find params[:brand_id]
    @send_list = @brand.send_lists.new params[:send_list]

    @send_list.save ? redirect_to(brand_send_lists_path(@brand)) : redirect_to(new_brand_campaign_version_path)    
  end
  
  def destroy
    @brand = Brand.find(params[:brand_id])
    @send_list = @brand.send_lists.find params[:id]
    @send_list.destroy ? redirect_to(brand_send_lists_path(@brand)) : redirect_to(new_brand_path)
  end

  # Needs to be used to search inside of send_lists contacts or something...
  def search
    
    
    @contacts = Contact.find(:all, :conditions => ["name LIKE :search", {:search => "%#{params[:user_input]}%"}], :limit => 5, :order => 'name')
    @send_list = SendList.find(params[:send_list_id])
    @send_lists_contact = @send_list.send_lists_contacts.new
    
    @contacts = NIL if params[:name].size < 2


    render :layout => false

  end

end
