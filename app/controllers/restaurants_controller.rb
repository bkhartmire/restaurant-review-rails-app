class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
    @cities = City.all
    @cuisines = Cuisine.all
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    redirect_to root_path, notice: "#{restaurant.name} has successfully been deleted."
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :city_id, :cuisine_id)
  end
end
