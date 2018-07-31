source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'semantic-ui-sass'
gem 'turbolinks', '~> 5.1.0'
gem 'jquery-rails'
gem 'devise'
gem 'activestorage'
gem 'mini_magick'
gem 'faker'
gem 'kaminari'

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
