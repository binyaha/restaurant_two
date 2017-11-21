class Admin::RestaurantsController < ApplicationController
before_action :authenticate_user!
before_action :authenticate_admin
before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants=Restaurant.all
  end

  def new
    @restaurant=Restaurant.new
  end

  def update
    if @restaurant.update(restaurant_param)
      redirect_to admin_restaurant_path(@restaurant.id)
      flash[:notice] = "restaurant was successfully updated"
    else
      render :edit
       flash[:alert] = "restaurant was failed to update"
    end
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

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
  end

  private 

  def restaurant_param
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description)
  end

  def find_restaurant
    @restaurant=Restaurant.find(params[:id])
  end

end
