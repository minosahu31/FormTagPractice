class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :destroy, :update]
  respond_to :html, :js

  def index
    @products = Product.all
   # @product = Product.new
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
  @product = Product.new(product_params)
     @product.save
      @products = Product.all 
  
    <<-DOC
    
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
          format.html { redirect_to @product, alert("Success....") }
          format.js {}
          format.json {
            render json: @product, status: :created, location: @product }
      else
          format.html{ render action: "new" }
          format.json { render json: @product.errors, status: :unprocessable_entity }      
      end

    end 
    
    DOC
   

  end

  def edit
  end

  def update
    @product.update(product_params)   
    @products = Product.all
  end

  def destroy
    @product.destroy
    @products = Product.all
  end

  def search
  end

  private

  def product_params
   params.permit(:name, :brand, :description)
  end

  def find_product
    @product =  Product.find(params[:id])
  end

end
