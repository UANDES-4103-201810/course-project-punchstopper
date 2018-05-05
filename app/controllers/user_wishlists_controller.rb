class UserWishlistsController < ApplicationController
  before_action :set_user_wishlist, only: [:show, :edit, :update, :destroy]

  # GET /user_wishlists
  # GET /user_wishlists.json
  def index
    @user_wishlists = UserWishlist.where("user_id = ?", current_user.id)
  end

  # GET /user_wishlists/1
  # GET /user_wishlists/1.json
  def show
  end

  # GET /user_wishlists/new
  def new
    @user_wishlist = UserWishlist.new
  end

  # GET /user_wishlists/1/edit
  def edit
  end

  # POST /user_wishlists
  # POST /user_wishlists.json
  def create
    @user_wishlist = UserWishlist.new(user_wishlist_params)

    respond_to do |format|
      if @user_wishlist.save
        format.html { redirect_to @user_wishlist, notice: 'User wishlist was successfully created.' }
        format.json { render :show, status: :created, location: @user_wishlist }
      else
        format.html { render :new }
        format.json { render json: @user_wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_wishlists/1
  # PATCH/PUT /user_wishlists/1.json
  def update
    respond_to do |format|
      if @user_wishlist.update(user_wishlist_params)
        format.html { redirect_to @user_wishlist, notice: 'User wishlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_wishlist }
      else
        format.html { render :edit }
        format.json { render json: @user_wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_wishlists/1
  # DELETE /user_wishlists/1.json
  def destroy
    @user_wishlist.destroy
    respond_to do |format|
      format.html { redirect_to user_wishlists_url, notice: 'User wishlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_wishlist
      @user_wishlist = UserWishlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_wishlist_params
      params.require(:user_wishlist).permit(:user_id, :project_id)
    end
end
