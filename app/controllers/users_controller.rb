class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    input_username = params.fetch("path_username")
    User.where({ :username => input_username })

    matching_username = User.where({ :username => input_username })
    @the_user = matching_username.first

    #if @the_user == nil
    # redirect_to("/404")
    #else
    render({ :template => "user_templates/show.html.erb" })
    #end
  end

  def add_user
    user = params.fetch("add_user", "Greg")

    newuser = User.new
    newuser.username = user

    #current_ids = User.all
    #current_ids = current_ids.username
    #filtered_ids = current_ids.order({ :id => :desc })

    #maxid = filtered_ids.at(0).to_i
    #maxid = maxid + 1

    #newuser.id = maxid
    newuser.save

    redirect_to("/users/" + newuser.username.to_s)

    #render({ :template => "photo_templates/update.html.erb" })
  end

  def update
    id = params.fetch("user_id")
    name = params.fetch("new_name", "howdy") #if not provided howdy is used

    matching_photos = User.where({ :id => id })
    the_photo = matching_photos.at(0)
    the_photo.username = name

    the_photo.save

    redirect_to("/users/" + the_photo.username.to_s)

    #render({ :template => "photo_templates/update.html.erb" })
  end
end
