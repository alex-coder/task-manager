require 'rails_helper'

RSpec.describe Web::TasksController, type: :controller do
  it 'should show all tasks' do
    get :index
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template('index')
  end
end
