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
end
