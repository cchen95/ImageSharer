class ImageMailer < ApplicationMailer

	def image_share_email(image, target, message)
		@image = image
		@message = message
		mail(to: target, subject: 'Bananas! B-A-N-A-N-A-S!')
	end
end
