class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def create
    Photo.create(photo_params) # attaches the uploaded file
    # ...
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
