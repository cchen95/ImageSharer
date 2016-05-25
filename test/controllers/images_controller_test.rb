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
    10.times { Image.create({link: 'https://asdf'}) }
    Image.create({link: 'https://asdf'})
    Image.create({link: 'https://asdf'})
    Image.create({link: 'https://asdf'})

    get :index
    assert_response :success
  end

  def test_index__no_images
    get :index
    assert_response :success
  end

  def test_edit
    image = Image.create!({link: 'https://asdf'})
    get :edit, id: image.id
    assert_response :success
  end

  def test_update
    image = Image.create!({link: 'https://asdf' })
    patch :update, id: image.id, image: {tag_list: ["asdf", "asd", "as", "a"]}
    assert_redirected_to images_path
    assert_equal image.tag_list, ["asdf", "asd", "as", "a"]
  end

  def test_update__remove_tags
    image = Image.create!({link: 'https://asdf', tag_list: ["asdf", "asd", "as", "a"] })
    assert_equal image.tag_list, ["asdf", "asd", "as", "a"]
    patch :update, id: image.id, image: {tag_list: []}
    image.reload
    assert_predicate image.tag_list, :empty?
  end

  def test_index__show_tags
    image1 = Image.create!({link: 'https://asdf', tag_list: ["testtag1", "testtag2", "testtag3", "testtag4"] })
    image2 = Image.create!({link: 'https://asdf', tag_list: ["testtag5", "testtag6", "testtag7", "testtag8"] })
    image3 = Image.create!({link: 'https://asdf', tag_list: ["testtag1", "testtag2", "testtag3", "testtag4"] })
    get :index, tag_name: 'testtag2'
    assert_equal assigns["images"], [image1, image3]
    assert_response :success
  end

end
