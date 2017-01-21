require 'rails_helper'

RSpec.describe Web::SessionsController, type: :controller do
  it 'should render login form' do
    get :new
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template('new')
  end

  it 'should login user' do
    user = create(:user)
    post :create, params: { session: { email: user.email, password: user.password } }
    expect(response).to redirect_to(root_path)
  end

  it 'should not login user' do
    user = create(:user)
    post :create, params: { session: { email: user.email }}
    expect(response).to redirect_to(new_sessions_path)
  end

  it 'should logout user' do
    delete :destroy
    expect(response).to redirect_to(new_sessions_path)
  end
end
