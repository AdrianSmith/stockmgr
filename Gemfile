source :gemcutter

gem "rails", "2.3.8"
gem 'authlogic', '~> 2.1'
gem 'will_paginate'
gem 'haml', '~> 3.0'
gem "compass", ">= 0.10.2"
gem 'prawn'
gem 'inherited_resources', '=1.0.6'
gem 'inherited_resources_views', '~> 0.3.0'
gem 'pg'

group :development do
  gem 'wirble'
  gem 'bond'
  gem 'bullet', :git => 'git://github.com/flyerhzm/bullet.git', :tag => 'v2.0.0.rc1'
end

group :test do
  gem "mocha", ">=0.9.8", :require=> false
  gem 'shoulda', ">= 2.11.1"
  gem 'rspec', '>=1.3.0', :require => false
  gem 'rspec-rails', '>= 1.3.2', :require => false
  gem 'json_pure', "~> 1.4.6", :require => false
  gem 'harmony', '>=0.5.6'
  gem 'nokogiri'
  gem 'rcov'
  gem 'metric_fu'
end

group :cucumber do
  gem 'cucumber-rails',    '>=0.3.2',  :require => false
  gem 'database_cleaner',  '>=0.5.0',  :require => false
  gem 'capybara',          '>=0.3.5',  :require => false
  gem 'rspec',             '>=1.3.0',  :require => false
  gem 'rspec-rails',       '>=1.3.2',  :require => false
  gem 'pickle'
  gem 'launchy'
  gem 'delorean', '>= 0.2'
end

group :test, :cucumber do
  gem 'faker'
  gem 'factory_girl', ">= 1.3.1"
end

group :development, :test, :cucumber do
  gem 'awesome_print', :require => 'ap'
  gem 'thin'
end
