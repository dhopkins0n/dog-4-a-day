class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  def index
    @dogs = Dog.all
    @users = User.all
   @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def new
    @dog = Dog.new
  end

  def show
    @booking = Booking.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to @dog, notice: "Your Dog was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to @dog, notice: 'Dog was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_url, notice: 'Dog was successfully destroyed.'
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :description, :photo)
  end
end
