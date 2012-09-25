class AudiencesController < ApplicationController
  
  def new
    @brand = Brand.find params[:brand_id]
    @audience = @brand.audiences.new
  end
  
  def create
    @brand = Brand.find(params[:brand_id])
    @audience = @brand.audiences.new(params[:audience])
    
    @audience.save ? redirect_to(brand_audiences_path(@brand)) : NIL
  end
  
  def index
    @brand = Brand.find(params[:brand_id])
  end
  
  def destroy    
    @audience = Audience.find params[:id]
    
    @audience.destroy ? redirect_to(brand_audiences_path(params[:brand_id])) : NIL
  end

end