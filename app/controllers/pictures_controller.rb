class PicturesController < ApplicationController

  def create
    @picture = Picture.new(params_picture)
    @picture.save
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
  end

  private

  def params_picture
    params.require(:picture).permit(:image, :picturable_type, :picturable_id)
  end

end
