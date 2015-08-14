require 'bundler/setup'
require File.join(File.dirname(__FILE__), 'app')

run App.freeze.app
