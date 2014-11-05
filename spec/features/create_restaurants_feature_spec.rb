 require 'rails_helper'

 describe 'creating restaurants' do


  it 'should check if a user is logged in before creating restaurants' do
    visit('/')
    click_link('Add a restaurant')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

end