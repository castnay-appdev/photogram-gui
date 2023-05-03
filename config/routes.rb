Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "user_details" })

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:path_photo", { :controller => "photos", :action => "photo_details" })

  get("/delete_photo/:path_photo", { :controller => "photos", :action => "delete_photo" })

  get("/insert_photo", { :controller => "photos", :action => "create"})

  get("/update_photo/:modify_id", { :controller => "photos", :action => "update"})

  get("/insert_comment_record", { :controller => "photos", :action => "new_comment"})

  get("/insert_user_record", { :controller => "users", :action => "new_user"})

  get("/update_user/:user_id", { :controller => "users", :action => "update_user"})

end
