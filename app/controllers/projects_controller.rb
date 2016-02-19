class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save!
    redirect_to project_path(@project)
  end

  def show
    redirect_to project_test_results_path(project_id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
