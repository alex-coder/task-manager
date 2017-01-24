require 'rails_helper'

RSpec.describe Web::Users::TasksController, type: :controller do
  it 'should show user\'s tasks' do
    user = create(:user)
    sign_in user
    get :index
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template('index')
  end

  it 'should show create form' do
    user = create(:user)
    sign_in user

    get :new
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template('new')
  end

  it 'should create new task' do
    user = create(:user)
    sign_in user

    post :create, params: {
      task: {
        name: Faker::Lorem.sentence,
        description: Faker::Lorem.sentences(rand(4..8)).join(' '),
        state: Task.state_machine.states.map(&:name).sample,
        user_id: user.id
      }
    }

    expect(response).to redirect_to(users_task_path(Task.last))
  end

  it 'should not create new task' do
    user = create(:user)
    sign_in user

    post :create, params: {
      task: {
        name: Faker::Lorem.sentence,
      }
    }

    expect(response).to render_template('new')
  end

  it 'should show task' do
    task = create(:task)
    sign_in task.user
    get :show, params: { id: task.id }
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template('show')
  end

  it 'should show edit form' do
    task = create(:task)
    sign_in task.user
    get :edit, params: { id: task.id }
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response).to render_template('edit')
  end

  it 'should update task' do
    task = create(:task)
    sign_in task.user
    task_params = {
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.sentences(rand(4..8)).join(' '),
      state: Task.state_machine.states.map(&:name).sample
    }

    patch :update, params: {
      id: task.id,
      task: task_params
    }

    task.reload
    expect(response).to redirect_to(users_task_path(task))
    expect(task_params[:name]).to eq(task.name)
    expect(task_params[:description]).to eq(task.description)
    expect(task_params[:state]).to eq(task.state_name)
  end

  it 'should not update task' do
    task = create(:task)
    sign_in task.user

    patch :update, params: {
      id: task.id,
      task: { name: nil }
    }

    expect(response).to render_template('edit')
  end

  it 'should remove task' do
    task = create(:task)
    sign_in task.user

    delete :destroy, params: { id: task.id }
    expect(response).to redirect_to(users_tasks_path)
    expect { Task.find(task.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
