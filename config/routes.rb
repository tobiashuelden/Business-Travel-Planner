Rails.application.routes.draw do

  get("/", { :controller => "webpage", :action => "homepage" })        

  get("/download_invoice.pdf", { :controller => "expenses", :action => "download_invoice" })        

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments/post/:path_id", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Chatroom resource:

  # CREATE
  post("/insert_chatroom", { :controller => "chatrooms", :action => "create" })
          
  # READ
  get("/chatrooms", { :controller => "chatrooms", :action => "index" })
  
  get("/chatrooms/:path_id", { :controller => "chatrooms", :action => "show" })
  
  # UPDATE
  
  post("/modify_chatroom/:path_id", { :controller => "chatrooms", :action => "update" })
  
  # DELETE
  get("/delete_chatroom/:path_id", { :controller => "chatrooms", :action => "destroy" })

  #------------------------------

  # Routes for the Company resource:

  # CREATE
  post("/insert_company", { :controller => "companies", :action => "create" })
          
  # READ
  get("/companies", { :controller => "companies", :action => "index" })
  
  get("/companies/:path_id", { :controller => "companies", :action => "show" })
  
  # UPDATE
  
  post("/modify_company/:path_id", { :controller => "companies", :action => "update" })
  
  # DELETE
  get("/delete_company/:path_id", { :controller => "companies", :action => "destroy" })

  #------------------------------

  # Routes for the Post resource:

  # CREATE
  post("/insert_post", { :controller => "posts", :action => "create" })
          
  # READ
  get("/posts/chatroom/public", { :controller => "posts", :action => "public_index" })

  get("/posts/chatroom/:company_id", { :controller => "posts", :action => "company_index" })

  get("/posts/:path_id", { :controller => "posts", :action => "show" })
  
  # UPDATE
  
  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })
  
  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Routes for the Expense resource:

  # CREATE
  post("/insert_expense", { :controller => "expenses", :action => "create" })

  get("/add_expense/:trip_id", { :controller => "expenses", :action => "add_expense" })
          
  # READ
  get("/manage_expenses", { :controller => "expenses", :action => "add" })

  get("/expenses", { :controller => "expenses", :action => "index" })
  
  get("/expenses/:path_id", { :controller => "expenses", :action => "show" })
  
  # UPDATE
  
  get("/update_expense/:path_id", { :controller => "expenses", :action => "update_expense" })

  post("/modify_expense/:path_id", { :controller => "expenses", :action => "update" })
  
  # DELETE
  get("/delete_expense/:path_id", { :controller => "expenses", :action => "destroy" })

  #------------------------------

  # Routes for the Trip resource:

  # CREATE
  post("/insert_trip", { :controller => "trips", :action => "create" })

  get("/add_trip", { :controller => "trips", :action => "add" })

  # READ
  get("/trips", { :controller => "trips", :action => "index" })
  
  get("/trips/:path_id", { :controller => "trips", :action => "show" })
  
  # UPDATE
  
  post("/modify_trip/:path_id", { :controller => "trips", :action => "update" })
  
  # DELETE
  get("/delete_trip/:path_id", { :controller => "trips", :action => "destroy" })

  #------------------------------

  # Routes for the Budget resource:

  # CREATE
  post("/insert_budget", { :controller => "budgets", :action => "create" })

  get("/add_budget", { :controller => "budgets", :action => "add" })
          
  # READ
  get("/budgets", { :controller => "budgets", :action => "index" })
  
  get("/budgets/:path_id", { :controller => "budgets", :action => "show" })
  
  # UPDATE
  
  post("/modify_budget/:path_id", { :controller => "budgets", :action => "update" })
  
  # DELETE
  get("/delete_budget/:path_id", { :controller => "budgets", :action => "destroy" })

  #------------------------------

  # Routes for the Business travel resource:

  get("/upcoming_business_travel", { :controller => "business_travels", :action => "upcoming" })

  # CREATE
  get("/add_business_travels_overview", { :controller => "business_travels", :action => "overview" })

  get("/add_business_travels", { :controller => "business_travels", :action => "add" })

  post("/insert_business_travel", { :controller => "business_travels", :action => "create" })
          
  # READ
  get("/business_travels_previous", { :controller => "business_travels", :action => "previous_index" })

  get("/business_travels_future", { :controller => "business_travels", :action => "future_index" })

  get("/business_travels/:path_id", { :controller => "business_travels", :action => "show" })
  
  # UPDATE
  
  get("/update_business_travel/:path_id", { :controller => "business_travels", :action => "update_form" })
  
  post("/modify_business_travel/:path_id", { :controller => "business_travels", :action => "update" })
  
  # DELETE
  get("/delete_business_travel/:path_id", { :controller => "business_travels", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
