require "test_helper"

class Watch::BrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @watch_brand = watch_brands(:omega)
  end

  test "should get index" do
    get watch_brands_url
    assert_response :success
  end

  test "should get new" do
    get new_watch_brand_url
    assert_response :success
  end

  test "should create watch_brand" do
    assert_difference("Watch::Brand.count") do
      post watch_brands_url, params: { watch_brand: { name: @watch_brand.name + "_1" } }
    end

    assert_redirected_to watch_brand_url(Watch::Brand.last)
  end

  test "should show watch_brand" do
    get watch_brand_url(@watch_brand)
    assert_response :success
  end

  test "should get edit" do
    get edit_watch_brand_url(@watch_brand)
    assert_response :success
  end

  test "should update watch_brand" do
    patch watch_brand_url(@watch_brand), params: { watch_brand: { name: @watch_brand.name } }
    assert_redirected_to watch_brand_url(@watch_brand)
  end

  test "should destroy watch_brand" do
    assert_difference("Watch::Brand.count", -1) do
      delete watch_brand_url(@watch_brand)
    end

    assert_redirected_to watch_brands_url
  end
end
