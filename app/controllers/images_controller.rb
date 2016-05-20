class ImagesController < ApplicationController
	def index
		@images = Image.all
	end
	def new
		@image = Image.new
	end

	def create
		@image = Image.new(image_params)
		if @image.save
			redirect_to images_path, notice: "Image successfully saved: #{@image.link}"
		else
			redirect_to images_path, notice: "Image link upload unsuccessful"
		end
	end

	def image_params
		params.require('image').permit('link')
	end

	def destroy
    @image = Image.find(params[:id])
    if @image.present?
      @image.destroy
    end
    redirect_to images_path, notice: "Immage successfully destroyed"
  end
end
