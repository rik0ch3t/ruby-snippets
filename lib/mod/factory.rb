require_relative 'ruby_workspace'

# Factory class for instantiating a language based workspace
class Factory
  def self.create(lang)
    case lang
    when 'ruby'
      RubyWorkspace.new
    else
      raise Exception.new('Unsupported language!')
    end
  end
end
