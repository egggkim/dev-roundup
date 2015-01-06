class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order("created_at DESC")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @project = Project.find(params[:id])    
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])    
    if @project.destroy
      redirect_to projects_path
    else
      redirect_to project_path(@project)
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :image)
  end
end
