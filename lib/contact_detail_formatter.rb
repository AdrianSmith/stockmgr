module ContactDetailFormatter
  def pretty_phone
    if phone_mobile
      phone_mobile
    elsif phone_work
      phone_work
    elsif phone_home
      phone_home
    else
      "None"
    end
  end

  def pretty_address
    address = String.new
    address += self.address_line_1.titleize if self.address_line_1
    address += "\n" + self.address_line_2.titleize if (self.address_line_2 and self.address_line_2.length > 0)
    address += "\n" + self.suburb_town.titleize if self.suburb_town
    address += " " + self.postcode.upcase if self.postcode
    address
  end   
end