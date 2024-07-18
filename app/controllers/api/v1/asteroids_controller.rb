class Api::V1::AsteroidsController < ApplicationController

  before_action :authenticate_request

  def index
    @asteroids = Asteroid.page(params[:page]).per(params[:per_page] || 10)
    render json: {
      asteroids: @asteroids,
      meta: {
        total_pages: @asteroids.total_pages,
        total_count: @asteroids.total_count,
        current_page: @asteroids.current_page,
        next_page: @asteroids.next_page,
        prev_page: @asteroids.prev_page,
        per_page: @asteroids.limit_value
      }
    }
  end

  def show
    @asteroid = Asteroid.find(params[:id])
    if @asteroid
      render json: @asteroid
    else
      render json: { error: "Asteroid not found" }, status: :not_found
    end
  end
end
