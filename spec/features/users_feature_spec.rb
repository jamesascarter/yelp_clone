require 'rails_helper'

context 'user not signed in and on the homepage' do
  it 'should see a "sign in" link and a "sign up" link' do
    visit('/')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end

  it 'should not see "sign out" link' do
    visit('/')
    expect(page).not_to have_link('Sign out')
  end
end

context 'user signed in on the homepage' do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  it 'should see "sign out" link' do
    visit('/')
    expect(page).to have_link('Sign out')
  end

  it 'should see "sign in" link and "sign up" link' do
    visit('/')
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end
end

context 'user can only ' do

 it 'should check if a user is logged in before creating restaurants' do
    visit('/')
    click_link('Add a restaurant')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

end