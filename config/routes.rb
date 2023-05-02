Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "user_details" })

  get("/photos", { :controller => "photos", :action => "index"})

end
