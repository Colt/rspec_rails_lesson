require 'spec_helper'

describe 'title' do
  it 'should not be empty' do
    todo = Todo.create(description: "my description")
    todo.should_not be_valid
    todo.errors[:title].should include("can't be blank")
  end
end

describe 'description' do
  it 'should not be empty' do
    todo = Todo.create(title: "Walk the grandma")
    todo.should_not be_valid
    todo.errors[:description].should include("can't be blank")
  end
end

describe 'all_todos_modified_after' do
  it 'should not return todos modified before given date' do
    todo1 = Todo.create(title: "my title", description: "my description", updated_at: (Time.now - 4.days))
    todo2 = Todo.create(title: "my title", description: "my description", updated_at: (Time.now - 1.day))
    date = (Time.now - 2.days)
    Todo.all_todos_modified_after(date).should eq([todo2])
  end
end
