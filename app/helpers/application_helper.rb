module ApplicationHelper
  def format_decimal_number(number)
    str = String.new
    if number == 1.0
      str = '1'
    else
      str = number.to_s
    end
    str
  end

  def format_currency(number, hide_zero=false)
    format = String.new
    if number
      if number < 0 then
        format = "(#{number_to_currency(number)})"
      elsif hide_zero && number == 0.0
        format = ""
      else
        format = number_to_currency(number)
      end
    end
    format
  end

  def format_date_and_time(date_time)
    date_time.strftime("%a %d %b %y | %H:%M") if date_time
  end

  def format_date(date)
    date.strftime("%a %d %b %y") if date
  end

  def format_time(time)
    time.strftime("%H:%M") if time
  end
end
