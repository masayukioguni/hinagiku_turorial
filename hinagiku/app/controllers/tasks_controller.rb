class TasksController < ApplicationController
  before_filter :prepare, :only => [ :index, :done ]

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @tasks = @category.tasks
    else
      @tasks = Task
    end
    @tasks = @tasks.undone
  end
  def done
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @tasks = @category.tasks
    else
      @tasks = Task
    end
    @tasks = @tasks.done
    render :index
  end
  
  def restart
    @task = Task.find(params[:id])
    @task.update_attribute(:done, false)
    redirect_to :back
  end

  def search
    @tasks = Task.undone
    @tasks = @tasks.search(params[:query]) if params[:query].present?
    render :index
  end
  
  def show
    @task = Task.find(params[:id])
  end
  def new
    @task = Task.new
  end
  def create
  	@task = Task.new(params[:task])
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end
  def edit
    @task = Task.find(params[:id])
  end
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task
    else
      render :edit
    end
  end
  def destroy
  	@task = Task.find(params[:id])
    @task.destroy
    redirect_to :tasks
  end
  def finish
    @task = Task.find(params[:id])
    @task.update_attribute(:done, true)
    redirect_to :back
  end

private
  def prepare
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @tasks = @category.tasks
    else
      @tasks = Task
    end
  end
end
