class UsersController < ApplicationController

  
  def index
    users =  User.all
    render json: {status: 200, user: users}
   end
 
   def show 
     user = User.find(params[:id])
     render json: {status: 200, user: user}
   end
 
   def update
     user = User.find(params[:id])
     user.update(user_params)
     render(json: {user: user})
   end
 
   def destroy
     user = User.destroy(params[:id])
     render(status: 204)
   end
 
   private # Any methods below here
 
   def user_params
     # Returns a sanitized hash of the params with nothing extra
     params.permit(:name, :email, :img_url, :password)
   end
 
end
