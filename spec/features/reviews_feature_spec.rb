require 'rails_helper'

describe 'reviewing' do

  before do
    @james = User.create(email: 'james@gmail.com', password:'11111111', password_confirmation:'11111111')
    @james.restaurants.create(name: 'KFC')

  end

  it 'allows users to leave a review using a form' do
    create_review
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  it 'only allows users to only create one review per restaurant' do
    login_as @james
    create_review
    expect(page).not_to have_content('Review KFC')
  end

  it 'allows users to delete reviews' do
    login_as @james
    create_review
    click_link 'Delete review'
    expect(page).not_to have_content('so so')
  end

  it 'only allows users to delete their own reviews' do
    login_as @elena
    create_review
    login_as @james
    visit '/'
    expect(page).not_to have_content('Delete review')

  end



end

def create_review
    visit '/'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'
end