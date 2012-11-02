
class SalesOrder < ActiveRecord::Base
  attr_accessible :customer_id, :invoiced, :invoiced_at, :paid, :paid_at, :private_comment, :public_comment

  belongs_to :customer
  has_many :sales_order_items, :include => :product, :dependent => :destroy

  validates_presence_of :customer

  def update_invoice_time
    self.invoiced_at = DateTime.now
    save!
  end

  def total_gst
    sales_order_items.inject(0){|sum, o| sum + o.gst}
  end

  def total_price
    sales_order_items.inject(0){|sum, o| sum + o.price}
  end

  def total_items
    sales_order_items.inject(0){|sum, o| sum + o.quantity}
  end

  def due_on
    self.created_at.to_datetime + APP_CONFIG['payment_days']
  end

  def overdue?
    Date.today > self.due_on  and self.paid? == false
  end

  def due_days
    (self.due_on - DateTime.now).to_i
  end

  def status_message
    status = ""

    if self.paid?
      status = "PAID"
    else
      if self.invoiced?
        status = "INVOICED"
      else
        status = "NOT INVOICED"
      end
    end
    status
  end

  def create_invoice_pdf
    require 'prawn'
    require 'prawn/layout'
    require 'prawn/table'
    require 'pdf_helper.rb'


    helper = PdfHelper.new
    pdf = helper.create_document

    helper.add_spacer(pdf)
    helper.add_spacer(pdf)
    helper.add_spacer(pdf)
    helper.add_spacer(pdf)

    helper.add_title(pdf, "INVOICE")
    helper.add_spacer(pdf)

    invoice_summary(pdf, helper)
    helper.add_spacer(pdf)

    invoice_comments(pdf, helper)
    helper.add_spacer(pdf)

    invoice_details(pdf, helper)

    helper.add_footer(pdf)

    pdf
  end

  private

  def invoice_summary(pdf, helper)
    helper.add_heading(pdf, customer.pretty_name)
    helper.add_text(pdf, customer.email)
    helper.add_text(pdf, customer.pretty_address)

    helper.add_spacer(pdf)

    helper.add_heading(pdf, "Details")
    helper.add_text(pdf, "Reference: #{self.id.to_s}")
    helper.add_text(pdf, "Date: #{FormatHelper.format_date(self.created_at)}")
    helper.add_text(pdf, "Status: #{self.status_message}")
  end

  def invoice_comments(pdf, helper)
    helper.add_heading(pdf, "Comments")
    helper.add_text(pdf, self.public_comment, 8) if self.public_comment
  end

  def invoice_details(pdf, helper)
    helper.add_heading(pdf, "Order Details")

    table_data =  [["ID", "Brand", "Product Name", "Unit Price", "Quantity", "Price"]]
    self.sales_order_items.each do |item|
      table_data << [
        item.product.id,
        item.product.brand,
        item.product.name,
        FormatHelper.format_currency(item.product.sale_price),
        FormatHelper.format_decimal_number(item.quantity),
        FormatHelper.format_currency(item.price).to_s
      ]
    end
    table_data << ["", "", "", "", "TOTAL", FormatHelper.format_currency(self.total_price)]
    table_rows = table_data.length - 1

    pdf.table(table_data) do
      cells.borders = []
      cells.padding = 2

      row(0).style(:font_style => :bold, :borders => [:bottom])
      column(0).style(:width => 25)
      column(1).style(:width => 100)
      column(2).style(:width => 240)
      column(3).style(:width => 50, :align => :right)
      column(4).style(:width => 50, :align => :right)
      column(5).style(:width => 50, :align => :right)
      row(table_rows).style(:font_style => :bold)
      cells[table_rows, 5].style(:borders => [:top, :bottom])
    end
  end
end
