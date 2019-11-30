# typed: true
require 'os'

# Filesystem module specific to this app.
module Filesystem

  # Directory operations.
  class Directory
    
    # Copy a snippet collection to .vscode.
    #
    # @param directory [Symbol] the directory of snippets (based on project)
    def copy(directory)
      if OS.linux?
        raise NotImplementedError.new("Snips does not support this OS.")
      elsif OS.mac?
        # TODO
      elsif OS.windows?
        raise NotImplementedError.new("Snips does not support this OS.")
      else
        raise NotImplementedError.new("Snips does not support this OS.")
      end
      # TODO
    end

    # Remove a snippet collection from .vscode.
    #
    # @param directory [Symbol] the directory of snippets (based on project)
    def remove(directory)
      # TODO
    end

    private

    # Builds a path to .vscode
    # @returns a properly formatted path to .vscode
    def get_vscode_path()
    end

    # Retrieves the location of the snippets
    # @returns a properly formatted path to snippets
    def get_snippet_path()
    end
  end

end