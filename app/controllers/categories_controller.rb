class CategoriesController < ApplicationController
  before_filter :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.page(params[:page])
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def create
    @category = Category.create(params[:category])
    respond_with(@category)
  end

  def edit
    respond_with(@category)
  end

  def update
    @category.update_attributes(params[:category])
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def find_category
      @category = Category.find(params[:id])
    end
end