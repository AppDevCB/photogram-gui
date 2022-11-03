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

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show.html.erb" })
    end
  end
end
