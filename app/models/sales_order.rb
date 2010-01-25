# == Schema Information
#
# Table name: sales_orders
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)
#  comment            :text
#  created_by_user_id :integer(4)
#  is_ordered         :boolean(1)
#  is_invoiced        :boolean(1)
#  is_paid            :boolean(1)
#  invoice_amount     :integer(10)
#  invoiced_at        :datetime
#  created_at         :datetime
#  updated_at         :datetime
#
require 'rubygems'
require 'prawn'

class SalesOrder < ActiveRecord::Base
  belongs_to :user
  has_many :sales_order_items

  validates_presence_of :user_id

  PAYMENT_DAYS = 14

  def total_price
    total = 0.0
    sales_order_items.each do |item|
      total += item.price
    end
    total
  end

  def total_cost
    total = 0.0
    sales_order_items.each do |item|
      total += item.product.stock_unit_cost
    end
    total
  end

  def due_on
    self.created_at.to_datetime + PAYMENT_DAYS
  end

  def is_overdue
    Date.today > self.due_on
  end

  def due_days
    (self.due_on - DateTime.now).to_i
  end

  def status_message
    status = "" 
    if self.is_paid
      status = "PAID"
    else
      if self.is_invoiced
        status = "ISSUED"
        if self.is_overdue
          status += ' (' + self.due_days.to_s + "days overdue)"
        else
          status += " (due in " + self.due_days.to_s + ' days)'
        end
      else
        status = "NOT ISSUED"
      end
    end
    status
  end

  def create_invoice_pdf
    helper = PdfHelper.new
    pdf = helper.create_document
    #    helper.add_footer(pdf)
    helper.add_spacer(pdf)
    helper.add_title(pdf, "TAX INVOICE")

    helper.add_sub_title(pdf, "*** Invoice Overdue ***") if self.is_overdue

    helper.add_spacer(pdf)
    helper.add_spacer(pdf)
    helper.add_spacer(pdf)
    helper.add_spacer(pdf)                

    helper.add_heading(pdf, "Invoice Details")

    table_data =  [
      ['Invoice', self.id.to_s, 'Invoice For', user.pretty_name], 
      ['Issue Date', FormatHelper.format_date(self.created_at), '', user.pretty_phone],
      ['Due Date', FormatHelper.format_date(self.due_on), '', user.email], 
      ['Status', self.status_message, '', user.pretty_address], 
    ]

    pdf.table table_data,
    :position           => :left,
    :row_colors         => :pdf_writer,
    :font_size          => 10,
    :row_colors         => ['FFFFFF'],
    :border_style       => :underline_header,
    :column_widths      => {0 => 70, 1 => 180, 2 => 70, 3 => 200},
    :align              => :left,
    :vertical_padding   => 2,
    :horizontal_padding => 4 

    helper.add_spacer(pdf)     
    helper.add_spacer(pdf)

    helper.add_heading(pdf, "Order Details")

    table_data =  Array.new
    self.sales_order_items.each do |item|
      table_data << [item.product.id,
        item.product.name, 
        item.product.supplier.name,
        item.quantity.to_s + ' ' + item.product.units_of_measure.short_name,
        FormatHelper.format_currency(item.product.price)  + ' / ' + item.product.units_of_measure.short_name,
        FormatHelper.format_currency(item.price).to_s
      ]
    end
    table_data << ["", "", "", "", "TOTAL", FormatHelper.format_currency(self.total_price)]

    pdf.table table_data,
    :headers            => ["ID", "Product", "Supplier", "Quantity", "Unit Price", "Price"],
    :position           => :left,
    :width              => pdf.bounds.width,
    :row_colors         => :pdf_writer,
    :font_size          => 9,
    :border_style       => :underline_header,
    :align_headers      => {3 => :center, 4 => :right, 5 => :right},
    :align              => {0 => :left, 3 => :center, 4 => :right, 5 => :right},
    :vertical_padding   => 2,
    :horizontal_padding => 4 

    pdf
  end

end



