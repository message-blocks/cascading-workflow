require 'rubygems'
require 'bundler/setup'
require 'mongoid'
require 'workflow'

require File.join(File.dirname(__FILE__), 'workflows', 'reservation_flow')

require File.join(File.dirname(__FILE__), 'models', 'event')
require File.join(File.dirname(__FILE__), 'models', 'ticket')
require File.join(File.dirname(__FILE__), 'models', 'session')
require File.join(File.dirname(__FILE__), 'models', 'group_registration')
require File.join(File.dirname(__FILE__), 'models', 'registration')
require File.join(File.dirname(__FILE__), 'models', 'session_registration')
require File.join(File.dirname(__FILE__), 'models', 'ticket_registration')

Mongoid.load!(File.join(File.dirname(__FILE__), '..', 'config', 'mongoid.yml'))

module Cascade
end
