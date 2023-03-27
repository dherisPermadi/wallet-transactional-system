source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'active_model_serializers', '~> 0.10.10'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'dotenv-rails', '~> 2.8.1'
gem 'kaminari', '~> 1.2.2'
gem 'rack-cors'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'ransack', '~> 4.0.0', github: 'activerecord-hackery/ransack'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot', '~> 6.2.1'
  gem 'rspec-rails', '~> 5.1.2'
end

group :development do
  gem 'listen', '~> 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]