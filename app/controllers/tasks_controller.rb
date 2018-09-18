# TASKS = [
#   { id: 1, name: "take out garbage", completion_date: "completed", description: "every day"},
#   { id: 2, name: "clean room", completion_date: "completed", description: "every week"}
# ]

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:completion_date)
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    # if @book.nil?
    #   render :notfound, status: :not_found
    # end
  end
end
