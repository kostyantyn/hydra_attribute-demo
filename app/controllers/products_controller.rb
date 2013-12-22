class ProductsController < ApplicationController
  before_filter :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.page(params[:page]).search(params)
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def create
    @product = Product.create(params[:product])
    respond_with(@product)
  end

  def edit
    respond_with(@product)
  end

  def update
    @product.update_attributes(params[:product])
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def find_product
      @product = Product.find(params[:id])
    end
end