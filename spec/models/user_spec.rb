require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should not save user without data' do
    user = User.new
    expect(user.save).to eq(false)
  end

  it 'should save user' do
    user = User.new email: 'test@users.com', password: 'test', role: :user
    expect(user.save).to eq(true)
  end
end
