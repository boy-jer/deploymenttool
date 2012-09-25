class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    @contact.save ? redirect_to(brands_path) : redirect_to(new_contact_path)
  end
  
  def destroy
    @contact = Contact.find params[:id]
    @contact.destroy ? redirect_to(contacts_path()) : NIL
  end
  
  def index
    @contacts = Contact.find(:all)
  end
  
  def search
    
    
    @contacts = Contact.find(:all, :conditions => ["name LIKE :search", {:search => "%#{params[:name]}%"}], :limit => 5, :order => 'name')
    @send_list = SendList.find(params[:send_list_id])
    @send_lists_contact = @send_list.send_lists_contacts.new
    
    @contacts = NIL if params[:name].size < 2


    render :layout => false

  end

end
