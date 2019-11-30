# typed: true
require 'thor'
require 'fileutils'

# Main CLI app
class CLI < Thor

  @@supported_lang = {
    "ruby" => ["thor", "metasploit"],
    "python" => [],
    "rust" => [],
  }

  desc "include", "Include snippets into the current workspace."
  option :lang, :aliases => ["-l"], :type => :string, :required => true, :desc => "The language specific snippets to use."
  option :proj, :aliases => ["-p"], :type => :string, :required => true, :desc => "The project specific snippets to use."
  def include()
    if !@@supported_lang.has_key?(options[:lang])
      puts "Error: '#{options[:lang].capitalize}' not supported."
      return 1
    end

    if !@@supported_lang[options[:lang]].include? options[:proj]
      puts "Error: '#{options[:proj].capitalize}' snippets unavailable."
      return 1
    end

    # creat .vscode if it does not exist
    vscode_path = File.join(Dir.pwd, ".vscode")
    if !vscode_path
      puts "Creating directory `.vscode` at #{vscode_path}..."
      Dir.mkdir(File.join(Dir.pwd, ".vscode"))
    end

    # copy selected projects snippets to .vscode
    snip_files_path = File.join(Dir.pwd, "projects/#{options[:proj]}/.")
    puts "Adding files to the `.vscode` directory..."
    FileUtils.cp_r(snip_files_path, vscode_path)

    puts "Done."
  end

  desc "include", "Include snippets into the current workspace."
  option :lang, :aliases => ["-l"], :type => :string, :required => true, :desc => "The language specific snippets to use."
  option :proj, :aliases => ["-p"], :type => :string, :required => true, :desc => "The project specific snippets to use."
  def exclude()
    if options[:lang] != 'ruby'
      puts "Error: Language not supported."
      return 1
    end

    if options[:proj].nil?
      puts "Error: Project type not provided."
      return 1
    end

    # creat .vscode if it does not exist
    vscode_path = File.join(Dir.pwd, ".vscode/#{options[:proj]}.code-snippets")
    if !vscode_path
      puts "Error: .vscode does not exist."
      return 1
    end

    # copy selected projects snippets to .vscode
    snip_files_path = File.join(Dir.pwd, "projects/#{options[:proj]}/.")
    FileUtils.rm_r(vscode_path)
  end
end