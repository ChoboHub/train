class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @products = Product.order(sort_column + " " + sort_direction)
  end

  def show
    @product
  end

  def new
    @newproduct = Product.new
  end

  def create
    @products = Products.new(params[:product])
    if @products.save
      redirect_to post_products_path(:post_id), :notice => "Your post was saved"
    else
      render "new"
    end
  end

  protected

  def set_resource
    @resource ||= Post.find(params[:post_id])
  end

  def set_product
    @product ||= Product.all
  end

  private

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
