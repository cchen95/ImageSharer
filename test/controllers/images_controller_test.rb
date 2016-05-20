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

  def test_destroy
    assert_difference 'Image.count', 0 do
      post :create, {image: {link: "asdf"}}
      delete :destroy, id:Image.last.id
    end
    assert_redirected_to images_path
  end
end
