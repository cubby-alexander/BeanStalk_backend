class RoastsController < ApplicationController

  def index 
    roast = Roast.all
    render json: {status: 200, roast: roast}
  end

  def show 
    roast = Roast.find(params[:id])
    render json: {status: 200, roast: roast}
  end
end
