class BrandsController < ApplicationController

  def index
    @brands = Brand.find :all, :order => 'name ASC'
  end

  def create
    @brand = Brand.new(params[:brand])
    @brand.save ? redirect_to(brands_path) : new_brand_path
  end

  def edit
  end
  
  def show
    @brand = Brand.find(params[:id])
  end
  
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy ? redirect_to(brands_path) : redirect_to(new_brand_path)
  end

  def new
    @brand = Brand.new
  end

end
