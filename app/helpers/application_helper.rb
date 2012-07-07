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

  def format_boolean(status)
    if status
      icon_tick
    else
      icon_cross
    end
  end

  def icon_csv(alt_text='CSV File')
    build_image_tag("csv48x48.jpg", alt_text)
  end

  def icon_html(alt_text='HTML File')
    build_image_tag("html35x35.jpg", alt_text)
  end

  def icon_pdf(alt_text='PDF File')
    build_image_tag("pdf48x48.jpg", alt_text)
  end

  def icon_tick(alt_text='Tick')
    build_image_tag("icons/001_06.png", alt_text)
  end

  def icon_cross(alt_text='Cross')
    build_image_tag("icons/001_05.png", alt_text)
  end

  def icon_stop(alt_text='Stop')
    build_image_tag("icons/001_29.png", alt_text)
  end

  def icon_exclaim(alt_text='Exclaim')
    build_image_tag("icons/001_11.png", alt_text)
  end

  def icon_warning(alt_text='Warning')
    build_image_tag("icons/001_30.png", alt_text)
  end

  def icon_add(alt_text='Add')
    build_image_tag("icons/001_01.png", alt_text)
  end

  def icon_subtract(alt_text='Subtract')
    build_image_tag("icons/001_02.png", alt_text)
  end

  def icon_play(alt_text='Play')
    build_image_tag("icons/001_25.png", alt_text)
  end

  def icon_show(alt_text='Show')
    build_image_tag("icons/001_37.png", alt_text)
  end

  def icon_edit(alt_text='Edit')
    build_image_tag("icons/001_45.png", alt_text)
  end

  def icon_delete(alt_text='Delete')
    build_image_tag("icons/001_49.png", alt_text)
  end

  def icon_ok(alt_text='OK')
    build_image_tag("icons/001_18.png", alt_text)
  end

  def icon_not_ok(alt_text='NOT OK')
    build_image_tag("icons/001_19.png", alt_text)
  end

  private

  def build_image_tag(image_file, alt_text)
    image_tag(image_file, :size =>"20x20", :alt => alt_text)
  end
end
