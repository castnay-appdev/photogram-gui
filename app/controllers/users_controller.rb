class UsersController < ApplicationController

  def index

    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def user_details

    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    if @the_user == nil 
      redirect_to("/404")
    else
      render({ :template => "user_templates/user_details.html.erb"})
    end
  end

  def new_user
    #Parameters: {"input_username"=>"martha"}

    username = params.fetch("input_username")
    
    new_username = User.new
    new_username.username = username 

    new_username.save
    
    redirect_to("/users/" + new_username.username.to_s)
  end

  def update_user
    #  Parameters: {"input_username"=>"cristina", "user_id"=>"112"}

    name_input = params.fetch("input_username")
    the_id = params.fetch("user_id")

    matching_users = User.where({ :id => the_id })
    the_user = matching_users.first

    the_user.username = name_input

    the_user.save

    redirect_to("/users/" + the_user.username.to_s)
  end


end
