class SendListsContactsController < ApplicationController

  def create
    @brand = Brand.find params[:brand_id]
    @send_list = @brand.send_lists.find params[:send_list_id]
    @send_list_contact = @send_list.send_lists_contacts.new params[:send_lists_contact]
    
    @send_list_contact.save ? redirect_to(brand_path(@brand)) : NIL
  end

end
