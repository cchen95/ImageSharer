class ImagesController < ApplicationController
	def index
		tag = params[:tag_name]
  	if tag.nil?
			@images = Image.all
		else
			@images = Image.tagged_with(tag)
		end
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
		params.require('image').permit('link', :tag_list, :target)
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

  def new_email
  	@email_form = EmailForm.new
  	#@target = params[:target]
  	#redirect_to images_path, notice: "Target is #{@target}"
  	# ImageMailer.image_share_email(@image, @target).deliver_later
  end

  def send_email
  	@target = params[:elephant][:target]
  	@message = params[:elephant][:message]
  	# params[:elephant]
  	@email_form = EmailForm.new(params[:elephant]) #also works "target: @target"
  	# puts @email_form
  	if !@email_form.valid?
  		flash[:notice] = "Bad email format"
  		render :new_email
  	else
	  	@image = Image.find(params[:id])
	  	ImageMailer.image_share_email(@image, @target, @message).deliver_now
	  	redirect_to images_path, notice: "Email sent!"
	  end
  end

  class EmailForm
  	include ActiveModel::Model
  	attr_accessor :target, :message
  	validates :target, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  end
end
