# typed: true
require 'thor'
require 'fileutils'
require 'colorize'

# Main CLI app
class CLI < Thor

  @@vscode_path = File.join(Dir.pwd, ".vscode")
  @@supported_lang = {
    "ruby" => ["thor", "metasploit", "sinatra"],
    "python" => [],
    "rust" => [],
  }

  desc "include", "Include snippets into the current workspace."
  option :lang, :aliases => ["-l"], :type => :string, :required => true, :desc => "The language specific snippets to use."
  option :proj, :aliases => ["-p"], :type => :string, :required => true, :desc => "The project specific snippets to use."
  def include()
    puts "Adding '#{options[:proj].capitalize}' snippets to the `.vscode` directory...".colorize(:yellow)
    validate_input(options[:lang], options[:proj])
    create_vscode_dir()
    copy_file_to_vscode(options[:proj])
    puts "Done!".colorize(:green)
  end

  desc "exclude", "Exclude snippets into the current workspace."
  option :lang, :aliases => ["-l"], :type => :string, :required => true, :desc => "The language specific snippets to use."
  option :proj, :aliases => ["-p"], :type => :string, :required => true, :desc => "The project specific snippets to use."
  def exclude()
    puts "Removing '#{options[:proj].capitalize}' snippets...".colorize(:yellow)
    validate_input(options[:lang], options[:proj])
    remove_file_from_vscode(options[:proj])
    puts "Done!".colorize(:green)
  end

  private

  # Validates the language and project
  # @params lang String, proj String
  def validate_input(lang, proj)
    if !@@supported_lang.has_key?(lang)
      puts "Error: '#{lang.capitalize}' not supported.".colorize(:red)
      return 1
    end

    if !@@supported_lang[lang].include? proj
      puts "Error: '#{proj.capitalize}' snippets unavailable.".colorize(:red)
      return 1
    end
  end

  # Creates a .vscode directory if it does not exist.
  def create_vscode_dir()
    if !@@vscode_path
      puts "Creating directory `.vscode` at #{vscode_path}...".colorize(:yellow)
      Dir.mkdir(@@vscode_path)
    end
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