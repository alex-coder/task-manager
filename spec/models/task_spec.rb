require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should save new task' do
    task = Task.new name: Faker::Lorem.sentence,
                    description: Faker::Lorem.sentences(rand(4..8)).join(' '),
                    state: %w(new started finished).sample,
                    user: create(:user)

    expect(task.save).to eq(true)
  end

  it 'should not save new task' do
    task = Task.new

    expect(task.save).to eq(false)
  end

  it 'should return all tasks' do
    user = create(:user, role: :admin)

    expect(user.fetch_tasks).to eq(Task.all)
  end

  it 'should return statuses list' do
    expect(Task.states.map(&:name)).to eq([:new, :started, :finished])
  end
end
