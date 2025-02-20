Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_id", :controller => "photos", :action => "photo_info")
  get("/delete_photo/:toast_id", :controller => "photos", :action => "baii")

  get("/insert_photo", :controller => "photos", :action => "create")
  get("/add_user", :controller => "users", :action => "add_user")
  get("/update_photo/:modify_id", :controller => "photos", :action => "update")

  get("/insert_comment_record", :controller => "photos", :action => "comment")

  get("/update_user/:user_id", :controller => "users", :action => "update")

  get("/", { :controller => "users", :action => "index" })
  
  
end
