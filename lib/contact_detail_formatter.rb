module ContactDetailFormatter

  def pretty_phone
    phone = String.new
    phone += (phone_work + ' (w) ') if (phone_work and phone_work.length > 0)
    phone += (phone_mobile + ' (m) ') if (phone_mobile and phone_mobile.length > 0)
    phone += (phone_home + ' (h) ') if (phone_home and phone_home.length > 0)
    return phone.strip
  end

  def pretty_address
    address = String.new
    address += address_line_1.titleize if address_line_1
    address += (", " + address_line_2.titleize) if (address_line_2 and address_line_2.length > 0)
    address += (", " + suburb_town.titleize) if (suburb_town and suburb_town.length > 0)
    address += (", " + city.titleize) if (city and city.length > 0)
    address += (", " + postcode.upcase) if (postcode and postcode.length > 0)
    return address.strip
  end   
end