require 'rails_helper'

describe 'deleting restaurants ' do

  before do
      @james = User.create(email: 'james@gmail.com', password:'11111111', password_confirmation:'11111111')
      @elena = User.create(email: 'elena@gmail.com', password:'22222222', password_confirmation:'22222222')
      @james.restaurants.create(name: 'KFC')
  end

  it 'should only allow a user to delete retaurants itself created' do
    login_as @elena
    visit '/'
    expect(page).not_to have_link('Delete KFC')
  end

end