class Admin::RestaurantsController < ApplicationController
before_action :authenticate_user!
before_action :authenticate_admin
  def index
    @restaurants=Restaurant.all
  end

  def new
    @restaurant=Restaurant.new
  end

  def create
    @restaurant=Restaurant.new(restaurant_param)
    if @restaurant.save
      redirect_to admin_restaurants_path
      flash[:notice] = "restaurant was successfully created"
    else
      render :new
      flash[:alert] = "restaurant was failed to create"
    end

  end

  private 

  def restaurant_param
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description)
  end

end
