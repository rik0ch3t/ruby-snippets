# typed: true
require 'thor'
require 'fileutils'
require 'colorize'
require 'mod/factory'

# Main CLI app
class CLI < Thor
  desc 'include', 'Add snippets to the current workspace.'
  option :lang, aliases: ['-l'], type: :string, required: true, desc: 'The language specific snippets to use.'
  option :proj, aliases: ['-p'], type: :string, required: true, desc: 'The project specific snippets to use.'
  def include
    puts "Adding '#{options[:proj].capitalize}' snippets to the `.vscode` directory...".colorize(:yellow)
    @lang_obj = Factory.create(options[:lang])
    @lang_obj.create_vscode_dir
    @lang_obj.add_snippet(options[:proj])
    puts 'Done!'.colorize(:green)
  end

  desc 'exclude', 'Remove snippets from the current workspace.'
  option :lang, aliases: ['-l'], type: :string, required: true, desc: 'The language specific snippets to use.'
  option :proj, aliases: ['-p'], type: :string, required: true, desc: 'The project specific snippets to use.'
  def exclude
    puts "Removing '#{options[:proj].capitalize}' snippets...".colorize(:yellow)
    @lang_obj = Factory.create(options[:lang])
    @lang_obj.remove_snippet(options[:proj])
    puts 'Done!'.colorize(:green)
  end

  desc 'setup LANG', 'Setup VScode for language specific development.'
  def setup(lang)
    begin
      @lang_obj = Factory.create(lang)
      @lang_obj.install_ext
    rescue Exception => e
      puts "Exception: #{e}"
      return 1
    end
  end

  desc 'teardown LANG', 'Teardown VScode for language specific development.'
  def teardown(lang)
    @lang_obj = Factory.create(lang)
    @lang_obj.uninstall_ext
  end
end
