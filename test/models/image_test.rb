require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_validation
  	assert_difference 'Image.count' do
  		Image.create({link: 'https://blah'})
  	end
  	assert_no_difference 'Image.count' do
  		Image.create({link: 'asdf'})
    end
  end
end
