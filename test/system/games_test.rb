require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end


  test 'inserting invalid word displays invalid message' do
    visit new_url
    fill_in 'word', with: 'asd'
    click_on 'Play'

    assert_text "Sorry but ASD can't be built"
  end

  # test 'inserting non english word displays invalid message' do
  #   visit new_url
  #   fill_in 'word', with: 'd'
  #   click_on 'Play'

  #   assert_text "Sorry but D does not seem to be a valid English word..."
  # end

  # test 'inserting valid english word displays congrats message' do
  #   visit new_url
  #   fill_in 'word', with: 'home'
  #   click_on 'Play'

  #   assert_text "Congratulations! HOME is a valida English word!"
  # end
end
