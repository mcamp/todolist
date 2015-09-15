class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_correct_user!, only: [:edit, :update, :done, :undone, :destroy]


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    @task.user = current_user
    if @task.save
      flash[:notice] = t("tasks.create.success")
      redirect_to tasks_path
    else
      render :action => :new
    end
  end

  def edit
    
  end

  def update
    
    if @task.set(params[:task])
      flash[:notice] = t("tasks.update.success")
      redirect_to tasks_path
    else
      render :action => :edit
    end
  end

  def destroy
   
    if @task.delete
      flash[:notice] = t("tasks.deleting.success")
    else
      flash[:notice] = t("tasks.deleting.error")
    end
    redirect_to tasks_path
  end

  def show
  end

  def index
    @tasks = current_user.tasks
  end

  def done 
    if @task.mark_done
      flash[:notice] = t("tasks.mark.done.success")
    else
      flash[:notice] = t("tasks.mark.done.error")
    end  
    redirect_to tasks_path
  end

  def undone
    if @task.mark_undone
      flash[:notice] = t("tasks.mark.undone.success")
    else
      flash[:notice] = t("tasks.mark.undone.error")
    end    

    redirect_to tasks_path
  end

  private

  def authenticate_correct_user!
    @task = Task.find(params[:id])
    if @task.user != current_user
      flash[:notice] = t("unauthorized")
      redirect_to tasks_path
    end
  end

end
