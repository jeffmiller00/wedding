class GuestCategoriesController < ApplicationController
  before_action :set_guest_category, only: [:show, :edit, :update, :destroy]

  # GET /guest_categories
  # GET /guest_categories.json
  def index
    @guest_categories = GuestCategory.all
  end

  # GET /guest_categories/1
  # GET /guest_categories/1.json
  def show
  end

  # GET /guest_categories/new
  def new
    @guest_category = GuestCategory.new
  end

  # GET /guest_categories/1/edit
  def edit
  end

  # POST /guest_categories
  # POST /guest_categories.json
  def create
    @guest_category = GuestCategory.new(guest_category_params)

    respond_to do |format|
      if @guest_category.save
        format.html { redirect_to @guest_category, notice: 'Guest category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @guest_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @guest_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guest_categories/1
  # PATCH/PUT /guest_categories/1.json
  def update
    respond_to do |format|
      if @guest_category.update(guest_category_params)
        format.html { redirect_to @guest_category, notice: 'Guest category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @guest_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guest_categories/1
  # DELETE /guest_categories/1.json
  def destroy
    @guest_category.destroy
    respond_to do |format|
      format.html { redirect_to guest_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest_category
      @guest_category = GuestCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_category_params
      params.require(:guest_category).permit(:name, :default_likelihood)
    end
end
