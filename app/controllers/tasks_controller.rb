# TASKS = [
#   { id: 1, name: "take out garbage", completion_date: "completed", description: "every day"},
#   { id: 2, name: "clean room", completion_date: "completed", description: "every week"}
# ]
require 'pry'
class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:completion_date)
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      #head :not_found
      render :notfound, status: :not_found
    end
  end

  def create
    @task = Task.new(name: params[:task][:name], completion_date: params[:task][:completion_date]) #instantiate a new task
    if @task.save # save returns true if the database insert succeeds
      redirect_to root_path # go to the index so we can see the task in the list
    else # save failed :(
      render :new # show the new task form view again, and all past entries create an id with nill
    end
  end

  # create blank table ### do not save!
  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id].to_i)
    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path # go to the index so we can see the task in the list
    else # save failed :(
      render :edit # show the new task form view again, and all past entries create an id with nill
    end
  end

  def update
    @task = Task.find(params[:id].to_i)
  end

  def destroy
  end
end
