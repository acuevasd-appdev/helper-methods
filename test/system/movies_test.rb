require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/movies"
    assert_selector "h1", text: "List of all movies"
  end

  test "creating a Movie" do
    original_movie_count = Movie.count

    visit "/movies"
    click_on "Add a new movie"
    
    fill_in "Title", with: "A title"
    fill_in "Description", with: "A description"
    click_on "Create Movie"

    assert_text "Movie created successfully"
    
    ending_movie_count = Movie.count
    assert_equal original_movie_count + 1, ending_movie_count
  end

  test "updating a Movie" do
    @movie = movies(:one)

    visit "/movies/#{@movie.id}/edit"

    fill_in "Title", with: "New title"
    fill_in "Description", with: "New description"
    
    click_on "Update Movie"
    
    assert_text "Movie updated successfully"

    @movie.reload
    assert_equal "New title", @movie.title
    assert_equal "New description", @movie.description
  end

  test "destroying a Movie" do
    @movie = movies(:one)
    original_movie_count = Movie.count

    visit "/movies"
    click_on "Show details", match: :first
    click_on "Delete movie"

    assert_text "Movie deleted successfully"
    
    ending_movie_count = Movie.count
    assert_equal original_movie_count - 1, ending_movie_count
  end

end
