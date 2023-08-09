# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show otc prescription branded generic]
  before_action :add_common_breadcrumbs

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
    add_breadcrumb @category.name, category_path(@category)
    @products = @category.products.page(params[:page]).per(10)
  end

  def otc
    otc_category("OTC")
  end

  def prescription
    otc_category("Prescription")
  end

  def branded
    otc_category("Branded")
  end

  def generic
    otc_category("Generic")
  end

  private

  def set_category
    @category = Category.find_by(name: params[:id])
  end

  def otc_category(name)
    @category = Category.find_or_create_by(name: name)
    add_breadcrumb @category.name, category_path(@category)
    @products = @category.products.page(params[:page]).per(10)
    render "show"
  end

  def add_common_breadcrumbs
    add_breadcrumb "Home", root_path
    add_breadcrumb "Categories", categories_path
  end
end
