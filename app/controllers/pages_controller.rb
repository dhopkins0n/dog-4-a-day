class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @dogs = Dog.all
  end

  def dashboard
    @dogs = Dog.all
    @bookings = current_user.bookings.where('start_time >= NOW()')
    @past_bookings = current_user.bookings.where('start_time <= NOW()')

  end
end
