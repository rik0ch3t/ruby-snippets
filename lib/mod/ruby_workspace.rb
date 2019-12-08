#!/usr/bin/env ruby

require_relative 'base'

# Class for instantiating a Ruby workspace
class RubyWorkspace < Base
  attr_reader :ruby_proj, :ruby_ext

  def initialize
    @ruby_proj = %w[
      thor
      metasploit
      sinatra
    ]
    @ruby_ext = %w[
      rebornix.ruby
      castwide.solargraph
      misogi.ruby-rubocop
    ]
  end
end
