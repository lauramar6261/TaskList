TASKS = [
  {name: "take out garbage", status: "completed"},
  {name: "clean room", status: "completed"}
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
