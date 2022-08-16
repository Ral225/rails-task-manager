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


  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

end
