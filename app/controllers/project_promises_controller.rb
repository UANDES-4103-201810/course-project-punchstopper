class ProjectPromisesController < ApplicationController
  before_action :set_project_promise, only: [:show, :edit, :update, :destroy]

  # GET /project_promises
  # GET /project_promises.json
  def index
    @project_promises = ProjectPromise.all
  end

  # GET /project_promises/1
  # GET /project_promises/1.json
  def show
  end

  # GET /project_promises/new
  def new
    @project_promise = ProjectPromise.new
  end

  # GET /project_promises/1/edit
  def edit
  end

  # POST /project_promises
  # POST /project_promises.json
  def create
    @project_promise = ProjectPromise.new(project_promise_params)

    respond_to do |format|
      if @project_promise.save
        format.html { redirect_to @project_promise, notice: 'Project promise was successfully created.' }
        format.json { render :show, status: :created, location: @project_promise }
      else
        format.html { render :new }
        format.json { render json: @project_promise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_promises/1
  # PATCH/PUT /project_promises/1.json
  def update
    respond_to do |format|
      if @project_promise.update(project_promise_params)
        format.html { redirect_to @project_promise, notice: 'Project promise was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_promise }
      else
        format.html { render :edit }
        format.json { render json: @project_promise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_promises/1
  # DELETE /project_promises/1.json
  def destroy
    @project_promise.destroy
    respond_to do |format|
      format.html { redirect_to project_promises_url, notice: 'Project promise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_promise
      @project_promise = ProjectPromise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_promise_params
      params.require(:project_promise).permit(:project_id, :description, :cost)
    end
end
