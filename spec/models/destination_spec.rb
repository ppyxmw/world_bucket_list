require 'rails_helper'

RSpec.describe Destination, type: :model do
  let (:user) do
    user = User.create!(
      email: 'albert@einstein.com',
      password: '12345678'
      )
  end

  it 'expects destination name to be unique' do
    user.destinations.create(name: 'Kampala')
    expect(user.destinations.new(name: 'Kampala')).to be_invalid
  end
end
