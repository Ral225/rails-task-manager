class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(task_params)
      if @tasks.save
        redirect_to tasks_path
      else
        redirect_to tasks_create_path
      end
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])
    if @tasks.update(task_params)
      redirect_to tasks_path(@tasks)
    else
      redirect_to edith_path(@tasks)
    end
  end

private

  def task_params
    params.require(:task).permit(:title, :details)
  end

end
