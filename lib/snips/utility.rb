# typed: true

# Utility operations.
module Utility
      
  # Copy a snippet collection to .vscode.
  #
  # @param directory [Symbol] the directory of snippets (based on project)
  def copy(directory)
    # puts Dir.pwd()
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