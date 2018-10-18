class CarsController < ApplicationController

  before_action :find_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
    #nothing needed because utilizing before_action.
  end

  def new
    @car = Car.new
    @owners = Owner.all
  end

  def create
    @car = Car.create(car_params)
    if @car.valid?
      redirect_to car_path(@car)
    else
     flash[:error] = @car.errors.full_messages
     redirect_to new_car_path
   end #end of if stmt
  end #end of method

  def edit
    @cars = Car.all
    @owners = Owner.all
  end

  def update
    @car.update(car_params)
     if @car.valid?
      redirect_to car_path(@car)
    else
      flash[:error] = @car.errors.full_messages
      redirect_to edit_car_path
    end #end of if stmt
  end #end of method

  def destroy
    @car.destroy
    redirect_to cars_path
  end


private

  def car_params
    params.require(:car).permit(:name, :color, :miles, :owner_id)
  end

  def find_car
    @car = Car.find_by(id: params[:id])
  end


end #end of class
