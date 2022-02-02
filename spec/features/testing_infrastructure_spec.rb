require "./app.rb"


feature 'Testing infrastructure' do

  scenario "Can enter names" do
    sign_in_and_play
    expect(page).to have_content "player1"
  end

  scenario "can set hp" do
    sign_in_and_play
    expect(page).to have_content "Player 2 health: 100" 
  end
end

