# typed: true
require 'thor'
require 'fileutils'
require 'colorize'
require 'mod/factory'

# Main CLI app
class CLI < Thor
  desc 'setup LANG', 'Setup VScode for language specific development.'
  option :proj, aliases: ['-p'], type: :string, desc: 'The project specific snippets to use.'
  option :add_ext, type: :boolean, desc: 'Add extensions.'
  def setup(lang)
    @lang_obj = Factory.create(lang)

    puts "Adding '#{options[:proj].capitalize}' snippets to the workspace".colorize(:yellow)
    @lang_obj.add_snippet(options[:proj])

    return unless options[:add_ext]

    puts 'Initiating extension installation...'.colorize(:yellow)
    @lang_obj.install_ext
  end

  desc 'teardown LANG', 'Teardown VScode for language specific development.'
  option :proj, aliases: ['-p'], type: :string, desc: 'The project specific snippets to use.'
  option :rm_ext, type: :boolean, desc: 'Remove extensions.'
  def teardown(lang)
    @lang_obj = Factory.create(lang)

    puts "Removing '#{options[:proj].capitalize}' snippets from the workspace.".colorize(:yellow)
    @lang_obj.remove_snippet(options[:proj])

    return unless options[:rm_ext]

    @lang_obj.uninstall_ext
  end
end
