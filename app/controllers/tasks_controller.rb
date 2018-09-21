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
    # how does it know which id it needs to save it to? it autogenerates an id - Task.new generates new id ? or .save?
    # get variables that user inputed:
    @task = Task.new(name: params[:task][:name], completion_date: params[:task][:completion_date]) #instantiate a new task
    if @task.save # save returns true if the database insert succeeds
      redirect_to root_path # go to the index so we can see the task in the list
    else # save failed :(
      render :new # show the new task form view again, and all past entries create an id with nill
    end
  end

  # create blank table ### do not save here otherwise it will keep creating blank forms!
  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id].to_i)
  end

  def update
    # does it know the id from the route?
    # how do I know that the parems are keys in the page? it's the standard a hash
    # Task.find or Task.new - is the default a post command?
    task = Task.find_by(id: params[:id].to_i)
    task.update(name: params[:task][:name], completion_date: params[:task][:completion_date], description: params[:task][:description])
    redirect_to task_path
    # update is an inhered method?
    #@task = Task.new(id: params[:task][:id], name: params[:task][:name], completion_date: params[:task][:completion_date], description: params[:task][:description])
    # needs to find the @task we are going to save below
    # if @task.save # save returns true if the database insert succeeds
    #   redirect_to task_path # go to the index so we can see the task in the list
    # else # save failed :(
    #   render :new
    # end
  end

  def destroy
  end
end
