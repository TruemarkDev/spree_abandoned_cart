class Spree::Admin::AbandonedCartsController < Spree::Admin::BaseController
  before_action :find_abandoned_cart, except: [:index ]
  respond_to :js, only: [:index]

  def index
    @abandoned_carts = Spree::AbandonedOrder.all.page(params[:page]).per(Spree::Config[:admin_products_per_page])
  end

  def destroy
    @abandoned_cart.destroy
    redirect_to admin_abandoned_carts_path, status: 303
  end

  private

  def find_abandoned_cart
    @abandoned_cart = Spree::AbandonedOrder.find(params[:id])
  end
end
