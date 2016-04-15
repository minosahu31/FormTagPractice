class PicturesController < ApplicationController
  
  before_action :find_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
    @products = Product.all
    @employees = Employee.all
  end

  def create
    imageable_type = params[:picture_for]
    if( imageable_type == "Product" )
      imageable_id = params[:selection1]
    else
      imageable_id = params[:selection2]
    end
    name = params[:name]  
    picture = Picture.new(name: name, imageable_id: imageable_id, imageable_type: imageable_type)
    picture.save
    @pictures = Picture.all
  end


  private 

  def find_picture
    @picture = Picture.find(params[:id])
  end

end
