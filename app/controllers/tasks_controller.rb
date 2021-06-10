class TasksController < ApplicationController
  before_action :set_task, only: %i(show edit update destroy)

  def index
    @tasks = current_user.tasks.recent
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    # @task = Task.new(task_params.merge(user_id: current_user.id))
    
    if @task.save
      redirect_to @task, notice: "タスク 「#{@task.name}」 を作成しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
    
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "タスク 「#{@task.name}」の更新しました。"
    else
      render :edit
    end
  end

  def destroy
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
