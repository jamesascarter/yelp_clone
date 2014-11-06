require 'rails_helper'

describe 'reviewing' do

  before do
    @james = User.create(email: 'james@gmail.com', password:'11111111', password_confirmation:'11111111')
    @elena = User.create(email: 'elena@gmail.com', password: '22222222', password_confirmation:'22222222')
    @james.restaurants.create(name: 'KFC')

  end

  it 'allows users to leave a review using a form' do
    create_review('so so', "4")
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  it 'only allows users to only create one review per restaurant' do
    login_as @james
    create_review('so so', 4)
    expect(page).not_to have_content('Review KFC')
  end

  it 'allows users to delete reviews' do
    login_as @james
    create_review('so so', 4)
    click_link 'Delete review'
    expect(page).not_to have_content('so so')
  end

  it 'only allows users to delete their own reviews' do
    login_as @elena
    create_review('so so', 4)
    login_as @james
    visit '/'
    expect(page).not_to have_content('Delete review')

  end

  it 'leaves an average rating for all reviews' do
    login_as @elena
    create_review('so so', "3")
    login_as @james
    create_review('so so', "5")
    expect(page).to have_content("Average rating: ★★★★☆")
  end

end

def create_review(thoughts, rating)
    visit '/'
    click_link 'Review KFC'
    fill_in "Thoughts", with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
end