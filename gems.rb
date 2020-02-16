# frozen_string_literal: true

# bundle install --path vendor/bundle
source 'https://rubygems.org'

group :default do
  gem 'baby_erubis', '~> 2.2'
  gem 'kamaze-version', '~> 1.0'
  gem 'sys-proc', '~> 1.1'
  gem 'thor', '~> 1.0'
  gem 'dry-auto_inject', '~> 0.7'
end

group :development do
  gem 'kamaze-project', '~> 1.0', '>= 1.0.3'
  gem 'listen', '~> 3.1'
  gem 'rubocop', '~> 0.72'
end

group :repl do
  gem 'interesting_methods', '~> 0.1'
  gem 'pry', '~> 0.12'
  gem 'pry-coolline', '~> 0.2'
end

group :doc do
  gem 'github-markup', '~> 3.0'
  gem 'redcarpet', '~> 3.4'
  gem 'yard', '~> 0.9'
  gem 'yard-coderay', '~> 0.1'
end

group :test do
  gem 'rspec', '~> 3.8'
  gem 'sham', '~> 2.0'
  gem 'simplecov', '~> 0.16'
end
