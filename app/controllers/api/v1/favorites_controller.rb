class Api::V1::FavoritesController < ApplicationController

  before_action :authenticate_request

  def create
    existing_favorite = @current_user.favorites.find_by(favoritable_params)
    if existing_favorite
      render json: { error: "You have already favorited this item." }, status: :unprocessable_entity
    else
      @favorite = @current_user.favorites.create(favoritable_params)
      if @favorite.save
        render json: @favorite, status: :created
      else
        render json: @favorite.errors, status: :unprocessable_entity
      end
    end
  end

  def index
    @favorites = @current_user.favorites
    render json: @favorites
  end

  def destroy
    @favorite = @current_user.favorites.find(params[:id])
    @favorite.destroy
    head :no_content
  end

  def remove_favorite
    @favorite = @current_user.favorites.find_by(favoritable_params)
    if @favorite
      @favorite.destroy
      render json: { message: "Favorite successfully removed" }, status: :ok
    else
      render json: { error: "Favorite not found" }, status: :not_found
    end
  end

  def find_favorite
    @favorite = @current_user.favorites.find_by(favoritable_params)
    render json: { exists: @favorite.present? }, status: :ok
  end

  private

  def favoritable_params
    params.require(:favorite).permit(:favoritable_type, :favoritable_id)
  end
end
