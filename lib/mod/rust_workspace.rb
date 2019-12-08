#!/usr/bin/env ruby

require_relative 'base'

# Class for instantiating a Ruby workspace
class RustWorkspace < Base
  attr_reader :rust_proj, :rust_ext

  def initialize
    @rust_proj = %w[
      cli
      embedded
      web
    ]
    @rust_ext = %w[
      rust-lang.rust
    ]
  end
end
