class Spree::Admin::AbandonedOrdersController < Spree::Admin::BaseController
  before_action :find_abandoned_cart, except: [:index ]
  respond_to :js, only: [:index]

  def index
    params[:q] ||= {}

    params_clone = params[:q].deep_dup

    if params_clone[:created_at_gt].present?
      params_clone[:created_at_gt] = Time.zone.parse(params_clone[:created_at_gt]).beginning_of_day rescue ''
    end

    if params_clone[:created_at_lt].present?
      params_clone[:created_at_lt] = Time.zone.parse(params_clone[:created_at_lt]).end_of_day rescue ''
    end

    params_clone[:send_emails_count] = params_clone[:send_emails_count].to_i

    @search = Spree::AbandonedOrder.ransack(params_clone)
    @abandoned_carts = @search.result(distinct: true).page(params[:page]).per(Spree::Config[:admin_products_per_page])
  end

  def destroy
    @abandoned_cart.destroy
    redirect_to admin_abandoned_orders_path, status: 303
  end

  private

  def find_abandoned_cart
    @abandoned_cart = Spree::AbandonedOrder.find_by(id: params[:id])
  end
end
