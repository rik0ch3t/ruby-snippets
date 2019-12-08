#!/usr/bin/env ruby

# Base class
class Base
  # Copy selected project snippets to .vscode
  def add_snippet(proj)
    create_vscode_dir
    workspace_path = File.join(Dir.pwd, '.vscode')
    snip_files_path = File.join(
      Dir.pwd, "projects/#{proj}/#{proj}.code-snippets"
    )
    FileUtils.cp_r(snip_files_path, workspace_path)
  end

  # Remove selected project snippets from .vscode
  def remove_snippet(proj)
    workspace_path = File.join(Dir.pwd, '/.vscode')
    FileUtils.rm_r("#{workspace_path}/#{proj}.code-snippets")
  end

  # Install extensions
  def install_ext
    @rust_ext.each do |ext|
      system("code --install-extension #{ext} --force")
    end
  end

  # Uninstall extensions
  def uninstall_ext
    @rust_ext.each do |ext|
      system("code --uninstall-extension #{ext} --force")
    end
  end

  private

  # Creates a .vscode directory if it does not exist.
  def create_vscode_dir
    workspace_path = File.join(Dir.pwd, '.vscode')

    return if Dir.exist?('.vscode')

    Dir.mkdir(workspace_path)
  end
end
