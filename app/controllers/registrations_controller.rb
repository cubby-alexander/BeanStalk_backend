class RegistrationsController < ApplicationController

  def create
    p params
    if (params.has_key?("roaster"))
    roaster = Roaster.create(
      name: params['roaster']['name'],
      password: params['roaster']['password'],
      password_confirmation: params['roaster']['password'],
      email: params['roaster']['email']
    )

    if roaster
      session[:roaster_id] =roaster.id
      render json: {
        status: :created,
        roaster: roaster
    } 
    else
      render json: {
      status: 500
      }
    end
  end

  if(params.has_key?("user"))
    user = User.create(
      name: params['user']['name'],
      password: params['user']['password'],
      password_confirmation: params['user']['password'],
      email: params['user']['email']
    )

    if user
      session[:user_id] =user.id
      render json: {
        status: :created,
        user: user
    } 
    else 
      render json: {
      status: 500
      }
    end
  end
end
end