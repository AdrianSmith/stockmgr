# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

users = User.create([{:email => 'admin@gmail.com', :password => 'test123', :password_confirmation => 'test123'}])

certifiers = Certifier.create([{:name => 'Uncertified Organic', :description => 'Uncertified organic as separate from unknown'}, {:name => 'Demeter', :description => 'Demeter is the only certification agent for Biodynamic® farms, processors and products in the United States. As a non-profit organization, Demeter’s mission is to improve the health of the planet and its people by providing certification of products whose ingredients are grown and processed according to the highest agricultural and environmental standards. From farm to market, only those companies that consistently meet these standards are permitted to display the Demeter certification mark.', :website => 'http://www.demeter.org.au/', :logo_image_url => '/images/certifiers/demeter.gif'}, {:name => 'Biological Farmers Australia', :description => 'The BFA actively works to influence standards development, represent your views at government level, and support the growth of the Australian organic market. It provides assistance in market intelligence, exporting requirements, and development of contacts and networks.', :website => 'http://www.bfa.com.au/', :logo_image_url => '/images/certifiers/bfa.gif'}])

payment_types = PaymentType.create([{:name => 'Cash'}, {:name => 'Cheque'}, {:name => 'Bank/electronic transfer'}, {:name => 'Paypal'}])

physical_forms = PhysicalForm.create([{:name => 'Liquid'}, {:name => 'Solid'}, {:name => 'Powder'}, {:name => 'Other'}])

product_types = ProductType.create([{:name => 'Grains', :description => 'Spelt, rye, oat, wheat.'}, {:name => 'Dairy', :description => 'Milk, cheddar cheese, feta cheese'}])

storage_locations = StorageLocation.create([{:name => 'Fridge under house', :description => 'Fridge under house'}, {:name => 'Freezer under house', :description => 'Freezer under house'}])

storage_types = StorageType.create([{:name => 'Cold', :description => 'Stored between 0 degrees C and 4 degrees C'}, {:name => 'Frozen', :description => 'Stored below -5 degrees C'}, {:name => 'Dry', :description => 'Stored below 25 degrees C and below 50% relative humidity'}, {:name => 'As supplied', :description => 'Stored in shelving arrangements under house. Atmospheric temperature conditions are fine.'}])

suppliers = Supplier.create([{:name => 'Eco Farms', :description => 'Established in 1986, Eco-Farms is Australia\'s leading dedicated supplier and exporter of certified organic and biodynamic food. Suppling to the independent organic and wholefood specialist retailers, healthfood stores, major supermarkets, cafes, caterers and manufacturers throughout Australia. We have also developed a number of key export markets with customers in Asia, New Zealand, Europe and the USA.', :website => 'http://www.ecofarms.com.au/', :email => 'sales@ecofarms.com.au', :comment => 'Avoid bring children as they are strict about health and safety in their warehouse', :delivery_rules => 'Orders over $200 may be delivered for free'}, {:name => 'Complete Health Products', :website => 'http://www.completehealthproducts.com.au', :email => 'orders@completehealthproducts.com.au', :address_line_1 => '34 Export Drive', :suburb_town => 'Molendinar', :city => 'Gold Coast', :postcode => '2414', :phone_work => '07 5571 6999'}])

units_of_measures = UnitsOfMeasure.create([{:name => 'each', :description => 'Each', :short_name => 'ea'}, {:name => 'litre', :description => 'Litres', :short_name => 'L'}, {:name => 'Other', :description => 'Undefined', :short_name => 'other'}])

customers = Customer.create([{:first_name => 'John', :last_name => 'Citizen', :email => 'john.citizen@gmail.com', :address_line_1 => '25 Brisbane St', :suburb_town => 'Brisbane', :postcode => '4000', :state => 'Queensland', :country => 'Australia', :phone_mobile => '0434 247 990'},{:first_name => 'Jane', :last_name => 'Average', :email => 'jane.average@gmail.com', :address_line_1 => '24 Brisbane St', :suburb_town => 'Brisbane', :postcode => '4000', :state => 'Queensland', :country => 'Australia', :phone_mobile => '0434 247 991'}])

products = Product.create([{:name => 'Almonds', :product_type_id => 1, :certifier_id => 1, :supplier_id => 1, :physical_form_id => 1, :storage_location_id => 1, :storage_type_id => 1, :units_of_measure_id => 1}, {:name => 'Pecans', :product_type_id =>  1, :certifier_id => 1, :supplier_id => 2, :physical_form_id => 1, :storage_location_id => 1, :storage_type_id => 1, :units_of_measure_id => 1}])


