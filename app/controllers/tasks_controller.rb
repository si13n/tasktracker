class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
  
    def index
       @tasks = Task.where(nil)
       @tasks = Task.order('created_at DESC').page params[:page]
       @tasks = @tasks.search(params)
       @tasks = @tasks.tasks(params)
    end

    def show
      @task = Task.find(params[:id])
      #@comments = @task.comments.order('created_at DESC').page(params[:page]).per(5)
    end

    def new
      @task = Task.new
    end

    def edit
        @task = Task.find(params[:id])
        #@comments = @task.comments.order('created_at DESC')
    end
  
    def create
      @task = Task.new(task_params)
      @task.save
      redirect_to @task
  
     
    end

    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to task_path, notice: 'Task was successfully updated.' }
          format.json { render :show, status: :ok, location: @task }
        else
          format.html { render :show }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
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
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def task_params
        params.permit(:summary, :description, :priority, :created_by, :tst, :dev, :tst_est, :dev_est, :project, :status)
      end
    end
  