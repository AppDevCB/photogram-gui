class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    # @list_ofPhotos =
    render({ :template => "photo_templates/index.html.erb" })
  end
end
