require 'rubygems'
require 'prawn'
require 'prawn/layout'  
require 'date'

# PDF Document helper class
class PdfHelper

  LOGO_IMAGE_FILE = "public/images/logo.jpg"
  LOGO_IMAGE_WIDTH = 120
  LOGO_IMAGE_POSN = [0,780]

  ADDRESS_TEXT = "Traditions With Food\n" + "25 Devon Street, Annerley, 4103\n" + "Phone: +61 (0)7 3160 5008\n" + "http://www.traditionswithfood.com"

  FONT_SIZE_BODY = 10

  FONT_SIZE_TITLE = 20
  FONT_SIZE_SUBTITLE = 16
  FONT_SIZE_HEADING = 14
  FONT_SIZE_SUBHEADING = 12

  FONT_SIZE_HEADER = 8
  FONT_SIZE_FOOTER = 8

  PAPER_SIZE = 'A4'

  def create_document()
    pdf_doc = Prawn::Document.new(:page_size => PAPER_SIZE) 
    # pdf_doc.image LOGO_IMAGE_FILE, :at => LOGO_IMAGE_POSN, :width => LOGO_IMAGE_WIDTH

    pdf_doc.font_size(FONT_SIZE_HEADER)
    pdf_doc.text_box ADDRESS_TEXT,
    :width    => 150, :height => pdf_doc.font.height * 4,
    :overflow => :ellipses,
    :at       => [pdf_doc.bounds.right - 150, pdf_doc.bounds.top]
    pdf_doc.move_down(FONT_SIZE_TITLE * 2)
    pdf_doc
  end

  def add_title(pdf_doc, text)
    pdf_doc.text text, :style => :bold, :size => FONT_SIZE_TITLE, :align => :center
  end

  def add_sub_title(pdf_doc, text)
    pdf_doc.text text, :style => :bold_italic, :size => FONT_SIZE_SUBTITLE, :align => :center
  end

  def add_heading(pdf_doc, text)
    pdf_doc.text text, :style => :bold, :size => FONT_SIZE_HEADING, :align => :left
  end

  def add_sub_heading(pdf_doc, text)
    pdf_doc.text text, :style => :bold_italic, :size => FONT_SIZE_SUBHEADING, :align => :left
  end

  def add_text(pdf_doc, text)
    pdf_doc.text text, :size => FONT_SIZE_BODY, :align => :left
  end

  # def add_footer(pdf_doc)
  #    pdf_doc.footer [pdf_doc.margin_box.left, pdf_doc.margin_box.bottom + 25] do
  #      pdf_doc.stroke_horizontal_rule
  #      pdf_doc.text "Created #{DateTime.now.strftime("%a %d %b %Y %H %m")}", :size => FONT_SIZE_FOOTER
  #    end
  #  end     

  def add_spacer(pdf_doc)
    add_heading(pdf_doc, " ")
  end  

  def new_page(pdf_doc)
    pdf_doc.start_new_page
  end

end