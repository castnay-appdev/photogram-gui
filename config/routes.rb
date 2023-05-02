Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "user_details" })

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:path_photo", { :controller => "photos", :action => "photo_details" })

  get("/delete_photo/:path_photo", { :controller => "photos", :action => "delete_photo" })

end
