# typed: true
require 'thor'
require 'fileutils'

# Main CLI app
class CLI < Thor
  desc "activate [language]", "Activate snippets for the [language] language."
  option :project, :aliases => ["-p"], :type => :string, :required => true, :desc => "The project specific snippets to use."
  def activate(language)
    if language != 'ruby'
      puts "Error: Language not supported."
      return 1
    end

    if options[:project].nil?
      puts "Error: Project type not provided."
      return 1
    end

    # creat .vscode if it does not exist
    vscode_path = File.join(Dir.pwd, ".vscode")
    if !vscode_path
      Dir.mkdir(File.join(Dir.pwd, ".vscode"))
    end

    # copy selected projects snippets to .vscode
    snip_files_path = File.join(Dir.pwd, "projects/#{options[:project]}/.")
    FileUtils.cp_r(snip_files_path, vscode_path)
  end

  desc "deactivate [language]", "Deactivate snippets for the [language] language."
  option :project, :aliases => ["-p"], :type => :string, :required => true, :desc => "The project specific snippets to use."
  def deactivate(language)
    # TODO
  end
end