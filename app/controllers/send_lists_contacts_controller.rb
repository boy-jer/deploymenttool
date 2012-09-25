class SendListsContactsController < ApplicationController

  def create
    @brand = Brand.find params[:brand_id]
    @send_list = @brand.send_lists.find params[:send_list_id]
    @send_list_contact = @send_list.send_lists_contacts.new ({:contact_id => params[:contact_id]})
    
    @send_list_contact.save ? redirect_to(brand_send_list_path(@brand, params[:send_list_id])) : NIL
  end
  
  def destroy
    @send_list_contact = SendListsContact.find(params[:id])
    
    @send_list_contact.destroy ? redirect_to(brand_send_list_path params[:brand_id], params[:send_list_id]) : NIL
  end

end
