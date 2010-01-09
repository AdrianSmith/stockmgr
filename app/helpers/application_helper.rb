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
  
  
  def icon_csv(alt_text='CSV File')
    image_tag("/images/csv48x48.jpg", :class => 'status', :size =>"32x32", :alt => alt_text)
  end

  def icon_html(alt_text='HTML File')
    image_tag("/images/html35x35.jpg", :class => 'status', :size =>"32x32", :alt => alt_text)
  end

  def icon_pdf(alt_text='PDF File')
    image_tag("/images/pdf48x48.jpg", :class => 'status', :size =>"32x32", :alt => alt_text)
  end

  def icon_tick(alt_text='Tick')
    image_tag("/images/icons/001_06.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_cross(alt_text='Cross')
    image_tag("/images/icons/001_05.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_stop(alt_text='Stop')
    image_tag("/images/icons/001_29.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_exclaim(alt_text='Exclaim')
    image_tag("/images/icons/001_11.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_warning(alt_text='Warning')
    image_tag("/images/icons/001_30.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_add(alt_text='Add')
    image_tag("/images/icons/001_01.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_subtract(alt_text='Subtract')
    image_tag("/images/icons/001_02.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_play(alt_text='Play')
    image_tag("/images/icons/001_25.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_show(alt_text='Show')
    image_tag("/images/icons/001_37.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_edit(alt_text='Edit')
    image_tag("/images/icons/001_45.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_delete(alt_text='Delete')
    image_tag("/images/icons/001_49.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_ok(alt_text='OK')
    image_tag("/images/icons/001_18.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end

  def icon_not_ok(alt_text='NOT OK')
    image_tag("/images/icons/001_19.png", :class => 'status', :size =>"20x20", :alt => alt_text)
  end  
  
end
