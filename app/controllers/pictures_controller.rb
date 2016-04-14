class PicturesController < ApplicationController
  
  before_action: find_picture, only: [:new, :edit, :update, :destroy]


  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params.permit[:name, :imageable_id, :imageable_type])
    @picture.save
    @pictures = Picture.all
  end


  private 

  def find_picture
    @picture = Picture.find(params[:id])
  end

end
