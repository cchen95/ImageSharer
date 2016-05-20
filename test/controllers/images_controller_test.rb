require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  def test_create
    assert_difference 'Image.count' do
      post :create, {image: {link: "asdf"}}
    end
    assert_redirected_to images_path
    assert_equal Image.last.link, "asdf"
  end
end
