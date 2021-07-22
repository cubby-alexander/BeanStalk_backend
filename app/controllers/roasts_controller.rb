class RoastsController < ApplicationController

  def index
    roasts = Roaster.find(params[:roaster_id]).roast
    render json: { status: 200, roasts: roasts }
  end

  def new
    roast = Roast.new
  end

  def destroy
    roaster = Roaster.find(params[:roaster_id])
    roast = roaster.roast.find(params[:id])
    roast.destroy
    redirect_to roaster_path(roaster)
  end

  def update
    roast = Roast.find(params[:id])
    roast.update(roast_params)
    render(json: { roast: roast })
  end

  def create
    roaster = Roaster.find(params[:roaster_id])
    roast = roaster.roast.create(roast_params)
    redirect_to roaster_path(roaster)
  end

  def show
    @roasts = Roast.find(params[:id])
    render json: { status: 200, roast: @roasts }
  end

  private

  def roast_params
    params.permit(:name, :picture, :notes, :origin, :description, :roaster_id, :beanType, :productionDate, :published)
  end
end
