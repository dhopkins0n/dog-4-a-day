class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  def index
    @dogs = Dog.all
    @users = User.joins(:dogs).distinct
   @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {user: user}),
         marker_html: render_to_string(partial: "marker")
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
      if params[:dog][:images]
        @dog.images.attach(params[:dog][:images][0])
      end
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
    params.require(:dog).permit(:name, :age, :breed, :description, :summary, :photo, tag_list: [], images: [])
  end
end
