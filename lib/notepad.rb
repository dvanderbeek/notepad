require "notepad/engine"

module Notepad
  mattr_accessor :base_controller
  @@base_controller = "::ApplicationController"

  mattr_accessor :author_method
  @@author_method = :current_user

  mattr_accessor :routing_namespace
  @@routing_namespace = nil

  def self.configure
    yield self 
  end
end
