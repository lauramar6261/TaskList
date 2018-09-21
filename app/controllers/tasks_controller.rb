# before creating a model to create data
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
      # head vs render?
      # what is head? sends back status code
      #head :not_found sends 404 - google looks for that
      # render calls the notfound html, and returns a status to the browser
      # render sends back full view - the notfound html -> user cares for that
      render :notfound, status: :not_found
    end
  end

  def create
    # Task.new - the default HTTP verb is a post
    # how does it know which id it needs to save it to? .save it autogenerates an id
    # get variables that user inputed using params
    @task = Task.new(name: params[:task][:name], completion_date: params[:task][:completion_date]) #instantiate a new task
    if @task.save # save returns true if the database insert succeeds #### creates an id
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
    # does it know the id from the route? needs to find it that's why we use find_by
    # how do I know that the parems are keys in the page? we know the structure is a hash
    @task = Task.find_by(id: params[:id].to_i)
    @task.update(name: params[:task][:name], completion_date: params[:task][:completion_date], description: params[:task][:description])
    #redirect_to task_path
    # update is an inhered method? yes!
    # the following statement requires @task instead of :edit because :edit looks for a @task
    # this following if statement is not really needed because updates and saves at the same time
    if @task.save
       redirect_to task_path # go to the index so we can see the task in the list
     else # save failed :(
       render :edit # edit view looks for @task
     end
  end

  def destroy
    task = Task.find_by(id: params[:id].to_i)
    task.destroy
    redirect_to root_path
  end
end
