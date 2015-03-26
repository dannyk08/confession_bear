source 'https://rubygems.org'

ruby '2.1.3' # Heroku likes it this way
################## Neccessary app gems ##################
gem 'haml', '~> 4.0.5'
gem 'bcrypt', '~> 3.1.7'
# gem 'devise', '~> 3.4.1'
gem 'bootstrap-sass', '~> 3.2.0'

################## Carrierwave app Inspiration ##################
gem 'mongoid', '~> 4.0.0'

gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'figaro'
gem 'fog'					# for Amazon S3
gem 'mini_magick' # for post-upload image processing

################## Production gems ##################
group :production, :staging do
  gem 'rails_12factor'
  gem 'thin'
end
################## Development gems ##################
group :development do 
	gem 'spring' 
	gem 'hpricot'
	gem 'ruby_parser'
	gem 'better_errors', '~> 2.0.0'
	# gem 'rails-footnotes', '~> 4.1.4'
end
################## Rails Defaults ##################
gem 'rails', '4.1.8'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc