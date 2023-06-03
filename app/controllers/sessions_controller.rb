class SessionsController < ApplicationController
  def new
  end

  def create
      # authenticate the user
    # 1. try to find the user by their unique identifier
    @user = User.find_by({ "email" => params["email"] })
    # 2. if the user exists -> check if they know their password
    if @user != nil && @user["password"] == params["password"]
      #if BCrypt::Password.new(@user["password"]) == params["password"]
        # 3. if they know their password -> login is successful
        
       flash["notice"] = "Welcome."
        redirect_to "/places"
      else
        # 4. if the email does not exist or they do not know their password -> login fails
        flash["notice"] = "Sorry, please try again"
        redirect_to "/login"
      #end
   end
  end 

  def destroy
    # logout the user
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/sessions/new"
  end

end

  