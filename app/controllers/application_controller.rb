# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password      

  helper_method :current_user

  def store_current_customer(user)
    clear_all_settings
    session[:current_customer_id] = user.id
  end
  def current_customer
    User.find(session[:current_customer_id])
  end

  def store_current_product(product)
    clear_all_settings
    session[:current_product_id] = product.id
  end
  def current_product
    User.find(session[:current_product_id])
  end

  def store_current_supplier(supplier)
    clear_all_settings
    session[:current_supplier_id] = supplier.id
  end
  def current_supplier
    User.find(session[:current_supplier_id])
  end

  def clear_all_settings
    session[:current_customer_id] = nil
    session[:current_supplier_id] = nil
    session[:current_product_id] = nil
    # session[:current_sales_order_id] = nil
    # session[:current_purchase_order_id] = nil
    # session[:current_payment_order_id] = nil
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end  

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end  

end
