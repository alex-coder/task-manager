require 'rails_helper'

RSpec.describe Api::TasksController, type: :controller do
  it 'should update task state' do
    task = create(:task, state: :new)
    sign_in task.user

    patch :state, params: {
      task_id: task.id,
      state: :started
    }, xhr: true

    expect(response).to be_success
    expect(Task.last.state).to eq('started')
  end
end
