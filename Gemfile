source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2'
gem 'puma', '~> 4.3'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'slim'
gem 'uglifier'
gem 'valid_email2'
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'
gem 'capistrano', require: false
gem 'capistrano-rails', require: false
gem 'capistrano-passenger', require: false
gem 'capistrano-rbenv', require: false
gem 'capistrano-rbenv-vars', require: false
gem 'capistrano-resque', require: false
gem 'pundit'
gem 'resque'


group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'pry-rails'
  gem 'slim-rails'
  gem 'html2slim'
  gem 'rspec-rails'
  gem 'pundit-matchers'
  gem 'factory_bot_rails'
  gem 'capybara'

end

group :development do
  gem 'letter_opener'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end