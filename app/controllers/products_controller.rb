class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :add_common_breadcrumbs

  def index
    @products = Product.page(params[:page]).per(10)

    @products = @products.where(on_sale: true) if params[:on_sale]
    @products = @products.where("created_at >= ?", 3.days.ago) if params[:new]
    @products = @products.where("updated_at >= ?", 3.days.ago) if params[:recently_updated]

    if params[:search].present?
      @products = @products.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%",
                                  "%#{params[:search]}%")
    end

    if params[:category].present?
      @category = Category.find(params[:category])
      add_breadcrumb @category.name, category_path(@category)
      @products = @products.where(category_id: params[:category])
    end
  end

  def show
    if @product.category
      add_breadcrumb @product.category.name, category_path(@product.category)
    end
    add_breadcrumb @product.name, product_path(@product)
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

  def add_common_breadcrumbs
    add_breadcrumb "Home", root_path
    add_breadcrumb "Products", products_path
  end
end


