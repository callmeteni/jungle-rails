class Admin::CategoriesController < ApplicationController
    # Ensure that only administrators can access these actions
    before_action :authenticate_admin
  
    # List all categories
    def index
      @categories = Category.all
    end
  
    # Create a new category
    def new
      @category = Category.new
    end
  
    # Save a new category
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path, notice: 'Category created!'
      else
        render :new
      end
    end
  
    private
  
    # Strong parameters for category creation
    def category_params
      params.require(:category).permit(:name)
    end
  
    # Authentication method for administrators
    def authenticate_admin
      authenticate_or_request_with_http_basic do |username, password|
        username == 'Jungle' && password == 'book'
      end
    end
  end