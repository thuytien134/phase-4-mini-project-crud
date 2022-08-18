class SpicesController < ApplicationController
    def index
        spice = Spice.all
        render json: spice
      end

      def create
        spice = Spice.create(title: params[:title], image: params[:image],description: params[:description],notes: params[:notes],rating: params[:rating])
        render json: spice, status: :created
      end

      def update
        spice = Spice.find_by(id: params[:id])
        if spice
          spice.update(spice_params)
          render json: spice
        else
          render json: { error: "Spice not found" }, status: :not_found
        end
      end

      def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
          spice.destroy
          head :no_content
        else
          render json: { error: "Spice not found" }, status: :not_found
        end
      end

      private

      def spice_params
        params.permit(:title, :image, :description,:notes,:rating)
      end


end
