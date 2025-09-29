require "application_system_test_case"

class Watch::BrandsTest < ApplicationSystemTestCase
  setup do
    @watch_brand = watch_brands(:one)
  end

  test "visiting the index" do
    visit watch_brands_url
    assert_selector "h1", text: "Brands"
  end

  test "should create brand" do
    visit watch_brands_url
    click_on "New brand"

    fill_in "Name", with: @watch_brand.name
    click_on "Create Brand"

    assert_text "Brand was successfully created"
    click_on "Back"
  end

  test "should update Brand" do
    visit watch_brand_url(@watch_brand)
    click_on "Edit this brand", match: :first

    fill_in "Name", with: @watch_brand.name
    click_on "Update Brand"

    assert_text "Brand was successfully updated"
    click_on "Back"
  end

  test "should destroy Brand" do
    visit watch_brand_url(@watch_brand)
    accept_confirm { click_on "Destroy this brand", match: :first }

    assert_text "Brand was successfully destroyed"
  end
end
