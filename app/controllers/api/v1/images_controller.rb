class Api::V1::ImagesController < ApplicationController

    before_action :authenticate_request

    def index
      @images = Image.all
      render json: @images
    end
  
    def show
      @image = Image.find(params[:id])
      if @image
        render json: @image
      else
        render json: { error: "Image not found" }, status: :not_found
      end
    end
end
