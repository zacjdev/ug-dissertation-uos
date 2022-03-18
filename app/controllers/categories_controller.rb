class CategoriesController < ApplicationController
  before_action :set_nav_indentifier
  before_action :find_category
  # Task 4
  authorize_resource
  # Task 13
  before_action :create_access_log

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new

    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def set_nav_indentifier
      @current_nav_identifier = :categories
    end

    def find_category
      @category = Category.find(params[:id]) if params[:id]
    end

    # Task 13
    def create_access_log
      PageView.create(controller_name: controller_name, controller_action: action_name, user: current_user, resource_id: params[:id])
    end
end
