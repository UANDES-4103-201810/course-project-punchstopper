class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @categories = Category.all
    if params[:my_projects] && params[:search].present?
        @projects = Project.where("user_id = ?", current_user.id).where('title LIKE ?', "%#{params[:search]}%")
    elsif params[:search].present?
        @projects = Project.where('title LIKE ?', "%#{params[:search]}%")
    elsif params[:my_projects] && params[:category].present?
        @projects = Project.where("user_id = ?", current_user.id).where("category_id= ?", params[:category])
    elsif params[:my_projects] && params[:outstanding]
        @projects = Project.where("user_id = ?", current_user.id).where(outstanding: true)
    elsif params[:my_projects] && params[:funded]
        @allprojects = Project.where("user_id = ?", current_user.id)
	      @projects = []
	      @allprojects.each do |project|
	        @sum = ProjectFunding.where("project_id= ?",project.id).sum(:amount)
    	    if @sum >= project.goal_amount
    	      @projects<<(project)
    	    end
        end
    elsif params[:my_projects]
        @projects = Project.where("user_id = ?", current_user.id)
    elsif params[:funded]
        @allprojects = Project.all
	      @projects = []
	      @allprojects.each do |project|
	        @sum = ProjectFunding.where("project_id= ?",project.id).sum(:amount)
  	      if @sum >= project.goal_amount
  	        @projects<<(project)
  	      end
        end
    elsif params[:outstanding]
        @projects = Project.where(outstanding: true)
    elsif params[:category].present?
        @projects = Project.where("category_id= ?", params[:category])
    else
        @projects = Project.all
    end 
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project_promises = ProjectPromise.where("project_id= ?",@project.id)
    @project_fundings = ProjectFunding.where("project_id= ?",@project.id)
    @sum = ProjectFunding.where("project_id= ?",@project.id).where("accepted= ?", true).sum(:amount)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  def add_funding
    @project=Project.find(params[:project_id])
  end

  def create_funding
    @funding = ProjectFunding.new(project_id: params[:project_id], user_id: current_user.id, amount: params[:amount])
    @project=Project.find(params[:project_id])
    authorize! :fund_project, @funding.project
    if @funding.save
      OwnerMailer.funding_notification(@project.user).deliver
      flash[:notice] = 'You funded the Project successfully.'
      redirect_to :action => "show", :id => params[:project_id]
    else
      redirect_back fallback_location: { action: "show", id: params[:project_id]}
    end
  end

  def make_outstanding
      @project = Project.find(params[:format])
      authorize! :make_project_outstanding, @project
      if @project.outstanding
        flash[:notice] = 'The Project is no longer Outstanding.'
      else
        flash[:notice] = 'The Project is now Outstanding.'
      end

      @project.update(outstanding: !@project.outstanding?)
      redirect_back fallback_location: @project
  end

  def add_to_wishlist
      @UserWishlist = UserWishlist.where("user_id = ? ", current_user.id).where("project_id = ? ", params[:format])
      if !@UserWishlist.present?
      	UserWishlist.create(user_id: current_user.id, project_id: params[:format]) 
        flash[:notice] = 'Added to Wishlist successfully.'
      end
      redirect_back fallback_location: @project     
  end

  def add_promise
    @project=Project.find(params[:project_id])
  end

  def create_promise
    @promise = ProjectPromise.new(project_id: params[:project_id], description: params[:description], cost: params[:cost])
    authorize! :manage, @promise.project
    if @promise.save
      flash[:notice] = 'The Promise was successfully created.'
      redirect_to :action => "show", :id => params[:project_id]
    else
      flash[:notice] = 'Fill all parameters.'
      redirect_back fallback_location: { action: "show", id: params[:project_id]}
    end
  end
  
  def fund_through_promise
      @promise = ProjectPromise.find(params[:promise_id])
      authorize! :fund_project, @promise.project
      @project=Project.find(params[:project_id])
      OwnerMailer.funding_notification(@project.user).deliver
      ProjectFunding.create(project_id: params[:format], user_id: current_user.id, project_promise_id: @promise.id, amount: @promise.cost)
      redirect_back fallback_location: @project, notice: "You bought a  #{@promise.description} successfully"
  end

  def pending_funds
    @projects = Project.where("user_id = ? ", current_user.id)
  end

  def accept_funds
    @funding = ProjectFunding.find(params[:format])
    @funding.update(accepted: true)
    flash[:notice] = 'The Funding was accepted successfully.'
    redirect_to :action => "pending_funds"
  end


  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:user_id, :title, :description, :category_id, :goal_amount, :finish_date, :delivery_date, :photo)
    end
end
