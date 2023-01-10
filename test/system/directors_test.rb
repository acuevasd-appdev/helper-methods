require "application_system_test_case"

class DirectorsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit directors_url
    assert_selector "h1", text: "List of all directors"
  end

  test "creating a Director" do
    original_director_count = Director.count

    visit "/directors"
    click_on "Add a new director"
    
    fill_in "Name", with: "John Doe"
    fill_in "DOB", with: "01/02/1987"
    click_on "Create Director"

    assert_text "Director created successfully"
    
    ending_director_count = Director.count
    assert_equal original_director_count + 1, ending_director_count
  end

  test "updating a Director" do
    @director = directors(:one)

    visit "/directors/#{@director.id}/edit"

    fill_in "Name", with: "Pepito Perez"
    fill_in "DOB", with: Date.today
    
    click_on "Update Director"
    
    assert_text "Director updated successfully"

    @director.reload
    assert_equal "Pepito Perez", @director.name
    assert_equal Date.today, @director.dob
  end

  test "destroying a Director" do
    @director = directors(:one)
    original_director_count = Director.count

    visit "/directors"
    click_on "Show details", match: :first
    click_on "Delete director"

    assert_text "Director deleted successfully"
    
    ending_director_count = Director.count
    assert_equal original_director_count - 1, ending_director_count
  end




end
