# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper 
  
  def format_currency(number, hide_zero=false)
    format = String.new
    if number
      if number < 0 then
        format = %q[<span style="color: red">] + number_to_currency(number) + "</span>"
      elsif hide_zero && number == 0.0 
        format = ""
      else
        format = number_to_currency(number)
      end
    end    
    format  
  end

  def format_date(date)
    date.strftime("%a %d %b %y") if date
  end

  def format_time(time)
    time.strftime("%H:%M") if time
  end
  
end
