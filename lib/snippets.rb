# typed: true
require "snippets"
require 'thor'

module Snippets
  class CLI < Thor

    desc "activate [language]", "Activate snippets for the [language] language."
    option :all, :type => :boolean, :default => false, :desc => "Deactivate all snippets."
    option :project, :aliases => ["-p"], :type => :string, :desc => "The project specific snippets to use."
    def activate(language)
      #TODO
    end

    desc "deactivate [language]", "Deactivate snippets for the [language] language."
    option :all, :type => :boolean, :default => false, :desc => "Deactivate all snippets."
    option :project, :aliases => ["-p"], :type => :string, :desc => "Deactivate project specific snippets."
    def deactivate(language)
      #TODO
    end

  end
end
