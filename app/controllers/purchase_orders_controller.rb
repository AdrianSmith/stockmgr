require 'format_helper'

class PurchaseOrdersController < InheritedResources::Base
  before_filter :authenticate_user!

  def edit
    @purchase_order = PurchaseOrder.find(params[:id])
    @available_products = ["Select ..."] + Product.find(:all, :conditions => ['supplier_id = ?', @purchase_order.supplier_id]).map{|p| [p.name + ' [' + FormatHelper.format_currency(p.purchase_price) + ' per ' + p.units_of_measure.short_name + ']', p.id]}
    @available_quantities = (1..10).to_a
    edit!
  end


  def destroy
    supplier = PurchaseOrder.find(params[:id]).supplier
    destroy! { supplier }
  end
end
