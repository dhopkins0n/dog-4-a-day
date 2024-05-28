class BookingsController < ApplicationController
  before_action :set_dog, only:[:new, :create]
  before_action :set_booking, only:[:edit, :update, :destroy]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.dog = @dog
    @booking.user = current_user
    if @booking.save!
      redirect_to dog_path(@dog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to dog_path(@booking.dog), notice: "Booking was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to dog_path(@booking.dog), status: :see_other, notice: 'Booking was successfully deleted.'
  end

  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :date, :status)
  end
end
