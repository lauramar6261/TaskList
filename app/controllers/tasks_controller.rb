TASKS = [
  { id: 1, name: "take out garbage", completion_date: "completed", description: "every day"},
  { id: 2, name: "clean room", completion_date: "completed", description: "every week"}
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end

  def show
    id = params[:id]
    id = id.to_i
    @task = TASKS.find do |task|
      task[:id] == id
    end
  end
end
