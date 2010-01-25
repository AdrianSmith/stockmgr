require File.dirname(__FILE__) + '/pdf_helper'
require 'test/unit'

class PdfHelperTest < Test::Unit::TestCase

  def test_initialize
    helper = PdfHelper.new
    assert_equal('A4', helper.paper_size)    
    assert_equal(10, helper.font_size)    
    assert_equal('Helvetica', helper.font_type)    
  end

  def test_create_document
    helper = PdfHelper.new
    pdf = helper.create_document
    assert_not_nil(pdf)
  end
  
  def test_add_header
    helper = PdfHelper.new
    pdf = helper.create_document
    helper.add_header(pdf, 'test header')
    assert_not_nil(pdf)
   end

  def test_add_footer
    helper = PdfHelper.new
    pdf = helper.create_document
    helper.add_footer(pdf)
    assert_not_nil(pdf)
  end

end