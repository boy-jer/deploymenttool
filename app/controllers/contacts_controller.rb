class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    
    @contact.save ? redirect_to(brands_path) : redirect_to(new_contact_path)
  end

end
