class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to @dog, notice: "Your Dog was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update
    redirect_to dog_path(@dog)
  end


  private

  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :description)
  end
end
