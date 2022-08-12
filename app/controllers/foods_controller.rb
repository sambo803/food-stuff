class FoodsController < ApplicationController
  def index
    foods = Food.all
    render json: foods.as_json
  end

  def create
    food = Food.new(
      meal: params[:meal],
      style: params[:style],
      size: params[:size],
      description: params[:description],
    )
    food.save
    render json: food.as_json
  end

  def show
    food = Food.find_by(id: params[:id])
    render json: food.as_json
  end

  def update
    food = Food.find_by(id: params[:id])
    food.meal = params[:meal] || food.meal
    food.style = params[:style] || food.style
    food.size = params[:size] || food.size
    food.description = params[:description] || food.description
    food.save
    render json: food.as_json
  end

  def destroy
    food = Food.find_by(id: params[:id])
    render json: { message: "food has been destroyed" }
    food.destroy
  end
end
