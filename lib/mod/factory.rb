#!/usr/bin/env ruby

require_relative 'ruby_workspace'
require_relative 'rust_workspace'

# Factory class for instantiating a language based workspace
class Factory
  def self.create(lang)
    case lang
    when 'ruby'
      RubyWorkspace.new
    when 'rust'
      RustWorkspace.new
    else
      raise StandardError.new "Unsupported language!"
    end
  end
end
