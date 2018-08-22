# Tasks Controller
class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @tasks = Task.where(nil)
    @tasks = Task.order('created_at DESC').page params[:page]
    @tasks = @tasks.search(params)
    @tasks = @tasks.tasks(params)
  end

  def show
    @task = Task.find(params[:id])
    @comments = @task.comments.order('created_at DESC').page params[:page]
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def update
      if @task.update(task_params)
        redirect_to task_path, notice: 'Task was successfully updated.'
      end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def task_params
    params.require(:task).permit(:summary, :description, :priority, :created_by, :tst, :dev, :tst_est, :dev_est, :project, :status, :comment)
  end
end
