class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_project, only: [:edit, :show, :update, :destroy]

  def new
  	@project = Project.new
  end

  def index
  	@projects = current_user.projects
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_project
  	@project = Project.find(params[:id])
  end
end
