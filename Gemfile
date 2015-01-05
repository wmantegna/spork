source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.1.6'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',   group: :doc
gem 'spring',             group: :development
gem 'bootstrap-sass'
gem 'high_voltage'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'sendgrid'

gem 'yelpster'

group :development do
  #gem 'better_errors'
  #gem 'binding_of_caller', :platforms=>[:mri_20]
  gem 'foreman'
  gem 'hub', :require=>nil
  gem 'rails_layout'
end

group :development, :test do
  #gem 'pry-rails'
  #gem 'pry-rescue'
  gem 'sqlite3'
  gem 'dotenv-rails'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end


group :development, :test do
  gem 'pry-rails'           # Causes rails console to open pry
                            # https://github.com/rweng/pry-rails
  gem 'pry-debugger'        # Adds step, next, finish, and continue commands and breakpoints
                            # https://github.com/nixme/pry-debugger
  gem 'pry-stack_explorer'  # Navigate the call-stack
                            # https://github.com/pry/pry-stack_explorer
  gem 'annotate'            # Annotate all your models, tests, fixtures, and factories
                            # https://github.com/ctran/annotate_models
  gem 'quiet_assets'        # Turns off the Rails asset pipeline log
                            # https://github.com/evrone/quiet_assets
  gem 'better_errors'       # Replaces the standard Rails error page with a much better and more useful error page
                            # https://github.com/charliesome/better_errors
  gem 'binding_of_caller'   # Advanced features for better_errors advanced features (REPL, local/instance variable inspection, pretty stack frame names)
                            # https://github.com/banister/binding_of_caller
  gem 'meta_request'        # Supporting gem for Rails Panel (Google Chrome extension for Rails development).
                            # https://github.com/dejan/rails_panel/tree/master/meta_request
end