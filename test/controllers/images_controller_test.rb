require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  def test_create
    assert_difference 'Image.count' do
      post :create, {image: {link: "https://asdf"}}
    end
    assert_redirected_to images_path
    assert_equal Image.last.link, "https://asdf"
  end

  def test_destroy
    image = Image.create!({link: 'https://idk'})

    assert_difference 'Image.count', -1 do
      delete :destroy, id: image.id
    end
    assert_redirected_to images_path
  end

  def test_index__with_images
    10.times { Image.create({link: 'asdf'}) }
    Image.create({link: 'asdf'})
    Image.create({link: 'asdf'})
    Image.create({link: 'asdf'})

    get :index
    assert_response :success
  end

  def test_index__no_images
    get :index
    assert_response :success
  end
end
