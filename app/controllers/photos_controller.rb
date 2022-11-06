class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index.html.erb" })
  end

  def photo_info
    #Parameters: {"path_photo"=>"777"}
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.at(0)
    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/show.html.erb" })
      # this is defensive code
    end
  end

  def baii
    #Parameters: {"path_id"=>"x"}
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({ :template => "photo_templates/baii.html.erb" })

    redirect_to("/photos")
  end

  def create
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    #render({ :template => "photo_templates/create.html.erb" })
    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    image = params.fetch("query_image")
    caption = params.fetch("query_caption", "howdy") #if not provided howdy is used
    the_id = params.fetch("modify_id", "howdy") #if not provided howdy is used

    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.at(0)
    the_photo.image = image
    the_photo.caption = caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)

    #render({ :template => "photo_templates/update.html.erb" })
  end

  def comment
    photo_id = params.fetch("input_photo_id")
    auth_id = params.fetch("input_author_id")
    comments = params.fetch("input_body")

    a_new_photo = Comment.new
    a_new_photo.photo_id = photo_id
    a_new_photo.body = comments
    a_new_photo.author_id = auth_id

    a_new_photo.save

    #render({ :template => "photo_templates/create.html.erb" })
    redirect_to("/photos/" + a_new_photo.photo_id.to_s)
  end
end
