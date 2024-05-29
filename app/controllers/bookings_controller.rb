class BookingsController < ApplicationController
  before_action :set_dog, only:[:create]
  before_action :set_booking, only:[:edit, :update, :destroy]

  def create
    @booking = Booking.new(booking_params)


    @booking.dog = @dog
    @booking.user = current_user
    respond_to do |format|
      if @booking.save
        format.html { redirect_to dashboard_path}
        format.json # Follows the classic Rails flow and look for a create.json view
      else
        format.html { render "dogs/show", status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json view
      end
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to dashboard_path, notice: "Booking was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to dog_path(@booking.dog), status: :see_other, notice: 'Booking was successfully deleted.'
  end

  # def pending?
  #   status: == 'Pending'
  # end

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
