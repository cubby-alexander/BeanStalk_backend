class RoastsController < ApplicationController

  def index 
    roast = Roast.all
    render json: {status: 200, roast: roast}
  end

  def update
    roast = Roast.find(params[:id])
    roast.update(roast_params)
    render(json: {roast: roast})
  end

  def show 
    roast = Roast.find(params[:id])
    render json: {status: 200, roast: roast}
  end
end
