class PhotosController < ApplicationController
  
  def index
      matching_photos = Photo.all
      @list_of_photos =  matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb" })
  end

  def photo_details
      url_id = params.fetch("path_photo")
      matching_photos = Photo.where({ :id => url_id })
      @the_photo = matching_photos.first

    render({ :template => "photo_templates/photo_details.html.erb" })
  end

  def delete_photo
      the_id = params.fetch("path_photo")
      matching_photos = Photo.where({ :id => the_id })
      the_photo = matching_photos.first
      the_photo.destroy

    redirect_to ("/photos")
  end

  def create
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image= input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update

    #Parameters: {"query_image"=>"https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80", "query_caption"=>"updated", "modify_id"=>"953"}
    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.first

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def new_comment
    #Parameters: {"input_photo_id"=>"713", "input_author_id"=>"Lucius", "input_body"=>"hello"}

    p_id = params.fetch("input_photo_id")
    a_id = params.fetch("input_author_id")
    body = params.fetch("input_body")

    new_comment = Comment.new
    new_comment.photo_id = p_id
    new_comment.author_id = a_id
    new_comment.body = body

    new_comment.save

    redirect_to("/photos/" + new_comment.photo_id.to_s)
  end
end
