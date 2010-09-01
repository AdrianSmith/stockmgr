require File.dirname(__FILE__) + '/format_helper'
require 'test/unit'

class FormatHelperTest < Test::Unit::TestCase

  def test_format_date
     sample_date = Time.mktime(2006, 12, 28)
     assert_equal('Thu 28 Dec 06', FormatHelper.format_date(sample_date))    
   end
   
   def test_format_time
     # Time.mktime(2003,3,13,3,4,5)
     # Thu Mar 13 03:04:05 +0000 2003
     sample_time = Time.mktime(2003,3,13,3,4,5)
     assert_equal('03:04', FormatHelper.format_time(sample_time))    
   end
   
   def test_format_currency
     assert_equal('$23.15', FormatHelper.format_currency(23.1523))    
   end
   
   def test_format_currency_nil
     assert_equal('$0.00', FormatHelper.format_currency(nil))
   end               
                  
  def test_format_currency_nil_display_zero
    assert_equal('$0.00', FormatHelper.format_currency(nil, true))    
  end

  def test_format_currency_zero_display_zero
    assert_equal('$0.00', FormatHelper.format_currency(0, true))    
  end

  def test_format_currency_zero_hide_zero
    assert_equal(nil, FormatHelper.format_currency(0, false))
  end
  
  def test_format_currency_number_hide_zero
    assert_equal('$100.00', FormatHelper.format_currency(100, false))
  end

end
