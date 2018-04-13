class ProjectMediaController < ApplicationController
  before_action :set_project_medium, only: [:show, :edit, :update, :destroy]

  # GET /project_media
  # GET /project_media.json
  def index
    @project_media = ProjectMedium.all
  end

  # GET /project_media/1
  # GET /project_media/1.json
  def show
  end

  # GET /project_media/new
  def new
    @project_medium = ProjectMedium.new
  end

  # GET /project_media/1/edit
  def edit
  end

  # POST /project_media
  # POST /project_media.json
  def create
    @project_medium = ProjectMedium.new(project_medium_params)

    respond_to do |format|
      if @project_medium.save
        format.html { redirect_to @project_medium, notice: 'Project medium was successfully created.' }
        format.json { render :show, status: :created, location: @project_medium }
      else
        format.html { render :new }
        format.json { render json: @project_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_media/1
  # PATCH/PUT /project_media/1.json
  def update
    respond_to do |format|
      if @project_medium.update(project_medium_params)
        format.html { redirect_to @project_medium, notice: 'Project medium was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_medium }
      else
        format.html { render :edit }
        format.json { render json: @project_medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_media/1
  # DELETE /project_media/1.json
  def destroy
    @project_medium.destroy
    respond_to do |format|
      format.html { redirect_to project_media_url, notice: 'Project medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_medium
      @project_medium = ProjectMedium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_medium_params
      params.require(:project_medium).permit(:project_id, :link, :link_type)
    end
end
