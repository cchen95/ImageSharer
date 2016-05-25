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
			flash[:notice] = "Image link upload unsuccessful"
			render :new
		end
	end

	def image_params
		params.require('image').permit('link', :tag_list)
	end

	def destroy
    @image = Image.find(params[:id])
    if @image.present?
      @image.destroy
    end
    redirect_to images_path, notice: "Image successfully destroyed"
  end

  def edit
  	@image = Image.find(params[:id])
  end

  def update
  	@image = Image.find(params[:id])
  	@image.tag_list = params[:image][:tag_list]
  	@image.save
  	redirect_to images_path, notice: "Image tags updated"
  end
end
