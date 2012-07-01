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
      ['Invoice Ref ', self.id.to_s, 'Invoice For', customer.pretty_name],
      ['Invoice Date', FormatHelper.format_date(self.created_at), '', customer.email],
      ['Status      ', self.status_message, '', customer.pretty_address],
    ]

    pdf.table(table_data) do
      cells.borders = []
      cells.padding = 2

      column(0).style(:width => 50 , :font_style => :bold)
      column(1).style(:width => 90 )
      column(2).style(:width => 180, :font_style => :bold, :align => :right)
      column(3).style(:width => 200)
    end

    def invoice_comments(pdf, helper)
      helper.add_heading(pdf, "Comments")
      helper.add_text(pdf, self.public_comment, 8) if self.public_comment
    end

    def invoice_details(pdf, helper)
      helper.add_heading(pdf, "Order Details")

      table_data =  [["Product ID", "Product Name", "Unit Price", "  ", "Quantity", "Price"]]
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
      table_data << ["", "", "", "", "TOTAL GST", FormatHelper.format_currency(self.total_gst)]
      table_data << ["", "", "", "", "TOTAL PRICE", FormatHelper.format_currency(self.total_price)]
      table_rows = table_data.length - 1

      pdf.table(table_data) do
        cells.borders = []
        cells.padding = 2

        row(0).style(:font_style => :bold, :borders => [:bottom])
        column(0).style(:width => 50)
        column(1).style(:width => 200)
        column(2).style(:width => 70, :align => :right)
        column(3).style(:size => 7)
        column(4).style(:width => 70, :align => :right)
        column(5).style(:width => 70, :align => :right)
        row(table_rows - 1).style(:font_style => :bold)
        row(table_rows).style(:font_style => :bold)
        cells[table_rows - 1,4].style(:borders => [:top])
        cells[table_rows - 1,5].style(:borders => [:top])
        cells[table_rows,4].style(:borders => [:bottom])
        cells[table_rows,5].style(:borders => [:bottom])
      end
    end
  end
end
