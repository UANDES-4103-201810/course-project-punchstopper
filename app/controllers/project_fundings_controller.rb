class ProjectFundingsController < ApplicationController
  before_action :set_project_funding, only: [:show, :edit, :update, :destroy]

  # GET /project_fundings
  # GET /project_fundings.json
  def index
    @project_fundings = ProjectFunding.all
  end

  # GET /project_fundings/1
  # GET /project_fundings/1.json
  def show
  end

  # GET /project_fundings/new
  def new
    @project_funding = ProjectFunding.new
  end

  # GET /project_fundings/1/edit
  def edit
  end

  # POST /project_fundings
  # POST /project_fundings.json
  def create
    @project_funding = ProjectFunding.new(project_funding_params)

    respond_to do |format|
      if @project_funding.save
        format.html { redirect_to @project_funding, notice: 'Project funding was successfully created.' }
        format.json { render :show, status: :created, location: @project_funding }
      else
        format.html { render :new }
        format.json { render json: @project_funding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_fundings/1
  # PATCH/PUT /project_fundings/1.json
  def update
    respond_to do |format|
      if @project_funding.update(project_funding_params)
        format.html { redirect_to @project_funding, notice: 'Project funding was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_funding }
      else
        format.html { render :edit }
        format.json { render json: @project_funding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_fundings/1
  # DELETE /project_fundings/1.json
  def destroy
    @project_funding.destroy
    respond_to do |format|
      format.html { redirect_to project_fundings_url, notice: 'Project funding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_funding
      @project_funding = ProjectFunding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_funding_params
      params.require(:project_funding).permit(:project_id, :user_id, :project_promise_id, :amount)
    end
end
