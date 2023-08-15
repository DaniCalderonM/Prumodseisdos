require "application_system_test_case"

class PspostsTest < ApplicationSystemTestCase
  setup do
    @pspost = psposts(:one)
  end

  test "visiting the index" do
    visit psposts_url
    assert_selector "h1", text: "Psposts"
  end

  test "should create pspost" do
    visit psposts_url
    click_on "New pspost"

    fill_in "Description", with: @pspost.description
    fill_in "Title", with: @pspost.title
    click_on "Create Pspost"

    assert_text "Pspost was successfully created"
    click_on "Back"
  end

  test "should update Pspost" do
    visit pspost_url(@pspost)
    click_on "Edit this pspost", match: :first

    fill_in "Description", with: @pspost.description
    fill_in "Title", with: @pspost.title
    click_on "Update Pspost"

    assert_text "Pspost was successfully updated"
    click_on "Back"
  end

  test "should destroy Pspost" do
    visit pspost_url(@pspost)
    click_on "Destroy this pspost", match: :first

    assert_text "Pspost was successfully destroyed"
  end
end
