class KittensController < ApplicationController
  before_action :find_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
  end

  def show
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten, notice: "You have now a new kitten!"
    else
      flash[:error] = "You have not succeeded."
      render 'new'
    end
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "You have updated your kitten!"
    else
      render 'edit'
    end
  end

  def destroy
    @kitten.destroy
    redirect_to root_url
  end

  private

  def find_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
