class SendListsController < ApplicationController

  def index
    @brand = Brand.find params[:brand_id]
    @send_lists = @brand.send_lists.find :all
  end
  
  def new
    @brand = Brand.find params[:brand_id]
    @send_list = @brand.send_lists.new
    
    @options = Hash.new
    Contact.find(:all).each { |c| @options.merge!({c.name => c.id}) }

  end
  
  def show
  
  end
  
  def create
    
  end

end
