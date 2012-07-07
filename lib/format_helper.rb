class FormatHelper

  def self.format_date(date)
    date.strftime("%a %d %b %y") if date
  end

  def self.format_time(time)
    time.strftime("%H:%M") if time
  end

  def self.format_delivery_week(date)
    'Wk ' + date.cweek.to_s + ' Yr ' + date.year.to_s
  end

  def self.format_currency(number, display_zero=true)
    if display_zero
      if number
        '$' + sprintf("%0.02f", number)
      else
        '$0.00'
      end
    else
      if number == 0
        nil
      else
        '$' + sprintf("%0.02f", number)
      end
    end
  end

  def self.format_list(list)
    str = String.new
    list.each do |item|
      str += item + ", "
    end
    str.chop.chop
  end

  def self.format_comments(comments)
    str = String.new
    comments.each do |comment|
      str += comment + ", "
    end
    str.chop.chop
  end

  def self.format_decimal_number(number)
    str = String.new
    if number == 1.0
      str = '1'
    else
      str = number.to_s
    end
    str
  end

end
