require 'rubygems'
require 'prawn'
require 'pdf_helper.rb'

class SalesOrder < ActiveRecord::Base
  belongs_to :customer
  has_many :sales_order_items, :dependent => :destroy

  validates_presence_of :customer

  def update_invoice_time
    self.invoiced_at = Time.now
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
    helper = PdfHelper.new
    pdf = helper.create_document

    helper.add_spacer(pdf)
    helper.add_spacer(pdf)
    helper.add_title(pdf, "TAX INVOICE")
    helper.add_sub_title(pdf, "*** Invoice Overdue ***") if self.overdue?
    helper.add_spacer(pdf)
    helper.add_spacer(pdf)
    helper.add_spacer(pdf)
    helper.add_spacer(pdf)

    invoice_summary(pdf, helper)

    helper.add_spacer(pdf)
    helper.add_spacer(pdf)

    invoice_comments(pdf, helper)

    helper.add_spacer(pdf)
    helper.add_spacer(pdf)

    invoice_details(pdf, helper)
    
    helper.add_footer(pdf)
    
    pdf
  end

  private

    def invoice_summary(pdf, helper)
      helper.add_heading(pdf, "Invoice Details")

      table_data =  [
        ['Invoice Id', self.id.to_s, 'Invoice For', customer.pretty_name],
        ['Issue Date', FormatHelper.format_date(self.created_at), '', customer.email],
        ['Status', self.status_message, '', customer.pretty_address],
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
    end

    def invoice_comments(pdf, helper)
      helper.add_heading(pdf, "Comments")
      helper.add_text(pdf, self.public_comment) if self.public_comment
    end

    def invoice_details(pdf, helper)
      helper.add_heading(pdf, "Order Details")

      table_data =  Array.new
      self.sales_order_items.each do |item|
        table_data << [
          item.product.id,
          item.product.name + ' [' + item.product.units_of_measure.short_name + ']',
          FormatHelper.format_currency(item.product.sale_price),
          item.product.gst_message,
          FormatHelper.format_decimal_number(item.quantity),
          FormatHelper.format_currency(item.price).to_s
        ]
      end
      table_data << [" ", "", "", "", "", ""]
      table_data << ["", "", "", "", "TOTAL GST", FormatHelper.format_currency(self.total_gst)]
      table_data << ["", "", "", "", "TOTAL PRICE", FormatHelper.format_currency(self.total_price)]

      pdf.table table_data,
        :headers            => ["Product ID", "Product Name", "Unit Price", "  ", "Quantity", "Price"],
        :position           => :left,
        :width              => pdf.bounds.width,
        :row_colors         => :pdf_writer,
        :font_size          => 9,
        :border_style       => :underline_header,
        :align_headers      => {0 => :left, 2 => :right, 3 => :left, 4 => :right, 5 => :right},
        :align              => {0 => :center, 2 => :right, 3 => :left, 4 => :right, 5 => :right},
        :vertical_padding   => 2,
        :horizontal_padding => 4
    end
end
