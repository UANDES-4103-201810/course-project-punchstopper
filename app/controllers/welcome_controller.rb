class WelcomeController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.where(outstanding: true)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:user_id, :title, :description, :goal_amount, :finish_date, :delivery_date)
  end


end
