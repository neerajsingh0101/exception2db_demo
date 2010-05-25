pwd = File.dirname(__FILE__)

$:.unshift File.join(pwd + '..' + 'lib')
$:.unshift File.join(pwd + '..' + 'lib', 'app')
$:.unshift File.join(pwd + '..' + 'lib', 'app', 'controllers')
$:.unshift File.join(pwd + '..' + 'lib', 'app', 'controllers', 'exception2db')


#module Exception2db
#end

ENV['RAILS_ENV'] = 'test'

rails_root = File.join(pwd, 'rails_root')

# start rails
require "#{rails_root}/config/environment"

Dir[File.join(pwd, '..', 'app', 'models', '*.rb')].each {|f| puts f;require f}
# require all the lib files plugin needs
Dir[File.join(pwd, '..', 'lib', '**', '*.rb')].each {|f| require f}

# initialize defaults
# TODO Change the name to Exception2db::Config
Exception2dbConfig.initialize_defaults

# require all the controllers plugin needs
Dir[File.join(pwd, '..', 'app', 'controllers', 'exception2db', '*.rb')].each {|f| require f}

# require plugin routes
require "#{rails_root}/../../config/routes.rb"

require 'test/unit'
require 'test_help'
silence_warnings { RAILS_ENV = ENV['RAILS_ENV'] }

# Run migrations
ActiveRecord::Migration.verbose = true
ActiveRecord::Migrator.migrate("#{rails_root}/db/migrate")

gem 'shoulda', '>= 2.10.2'
require 'shoulda'

gem 'will_paginate', '>= 2.3.11'
require 'will_paginate'

gem 'factory_girl', '= 1.2.4'
require 'factory_girl'

gem 'flexmock', '>= 0.8.6'
require 'flexmock'

gem 'redgreen', '>= 1.2.2'
require 'RedGreen'

# for helper tests
require 'action_view/test_case'

Dir[File.join(pwd, 'factories', '*.rb')].each { |f| require File.expand_path(f) }

class ActiveSupport::TestCase

  def revoke_read_only_access
    AdminDataConfig.set = ({:is_allowed_to_view => Proc.new { |controller| false } })
  end

  def grant_read_only_access
    AdminDataConfig.set = ({:is_allowed_to_view => Proc.new { |controller| true } })
  end

  def grant_update_access
    AdminDataConfig.set = ({:is_allowed_to_update => Proc.new { |controller| true } })
  end

  def revoke_update_access
    AdminDataConfig.set = ({:is_allowed_to_update => Proc.new { |controller| false } })
  end

  def show_response
    Dir.mkdir(File.join(RAILS_ROOT, 'tmp')) unless File.directory?(File.join(RAILS_ROOT,'tmp'))
    response_html = File.join(RAILS_ROOT, 'tmp', 'response.html')
    File.open(response_html, 'w') { |f| f.write(@response.body) }
    system 'open ' + File.expand_path(response_html) rescue nil
  end

end

