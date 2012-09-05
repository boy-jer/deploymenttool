class SendListsController < ApplicationController

  def index
    @send_lists = SendList.find_by_brand_id params[:brand_id]
  end
  
  def new
    @brand = Brand.find params[:brand_id]
    @send_list = @brand.send_lists.new
  end
  
  def create
    
  end

end
