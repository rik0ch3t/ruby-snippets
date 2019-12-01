# typed: true
require 'thor'
require 'fileutils'
require 'colorize'

# Main CLI app
class CLI < Thor
  # globals
  @@vscode_path = File.join(Dir.pwd, '.vscode')
  @@supported_lang = {
    'ruby' => %w[thor metasploit sinatra],
    'python' => [],
    'rust' => []
  }

  # Common options
  class_option :lang, aliases: ['-l'], type: :string, required: true, desc: 'The language specific snippets to use.'
  class_option :proj, aliases: ['-p'], type: :string, required: true, desc: 'The project specific snippets to use.'

  desc 'include', 'Include snippets into the current workspace.'
  def include
    puts "Adding '#{options[:proj].capitalize}' snippets to the `.vscode` directory...".colorize(:yellow)

    create_vscode_dir
    copy_file_to_vscode(options[:proj])

    puts 'Done!'.colorize(:green)
  end

  desc 'exclude', 'Exclude snippets into the current workspace.'
  def exclude
    puts "Removing '#{options[:proj].capitalize}' snippets...".colorize(:yellow)

    remove_file_from_vscode(options[:proj])

    puts 'Done!'.colorize(:green)
  end

  private

  # Creates a .vscode directory if it does not exist.
  def create_vscode_dir
    return if @@vscode_path

    puts "Creating directory `.vscode` at #{vscode_path}...".colorize(:yellow)
    Dir.mkdir(@@vscode_path)
  end

  # Copy selected project snippets to .vscode
  def copy_file_to_vscode(proj)
    snip_files_path = File.join(Dir.pwd, "projects/#{proj}/.")
    FileUtils.cp_r(snip_files_path, @@vscode_path)
  end

  # Remove selected project snippets from .vscode
  def remove_file_from_vscode(proj)
    FileUtils.rm_r("#{@@vscode_path}/#{proj}.code-snippets")
  end
end
