class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :redirect_if_logged_in
  def home
    @dogs = Dog.all
  end

  def dashboard
    @dogs = Dog.all
  end

  def redirect_if_logged_in
    if user_signed_in?
      redirect_to dogs_path
    end
  end
end
