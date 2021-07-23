class SessionsController < ApplicationController
include CurrentRoasterConcern
  def logged_in
    if @current_roaster
      render json: {
        logged_in: true,
        roaster: @current_roaster
      }
    else
      render json: {
        loggin_in: false
      }
    end
  end

  def logout 
    reset_session
    render json: {status: 200, logged_out: true}
  end


  def create
    roaster = Roaster
    .find_by(email: params['account']["email"])
    .try(:authenticate, params["account"]["password"])

    user = User.find_by(email: params['account']['email'])
             .try(:authenticate, params["account"]["password"])

    if roaster
      session[:roaster_id] = roaster.id
      render json: {
        status: :created,
        logged_in: true,
        roaster: roaster
      }
    elsif user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: {status: 401}
    end
  end
end

=begin
curl --header "Content-Type: application/json" --request POST --data '{"roaster": {"email": "merit@coffee.com", "password": "meritcoffee"}}' http://localhost:3001/sessions
=end

