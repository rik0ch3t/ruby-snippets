# Class for instantiating a Ruby workspace
class RubyWorkspace
  attr_reader :ruby_proj, :ruby_ext

  def initialize
    @ruby_proj = %w[
      thor
      metasploit
      sinatra
    ]
    @ruby_ext = %w[
      rebornix.ruby
      castwide.solargraph
      misogi.ruby-rubocop
    ]
  end

  # Copy selected project snippets to .vscode
  def add_snippet(proj)
    workspace_path = File.join(Dir.pwd, '.vscode')
    snip_files_path = File.join(Dir.pwd, "projects/#{proj}/.")
    FileUtils.cp_r(snip_files_path, workspace_path)
  end

  # Remove selected project snippets from .vscode
  def remove_snippet(proj)
    workspace_path = File.join(Dir.pwd, '.vscode')
    FileUtils.rm_r("#{workspace_path}/#{proj}.code-snippets")
  end

  # Install extensions
  def install_ext
    @ruby_ext.each do |ext|
      system("code --install-extension #{ext} --force")
    end
  end

  # Uninstall extensions
  def uninstall_ext
    @ruby_ext.each do |ext|
      system("code --uninstall-extension #{ext} --force")
    end
  end

  # Creates a .vscode directory if it does not exist.
  def create_vscode_dir
    workspace_path = File.join(Dir.pwd, '.vscode')
    return if workspace_path

    puts "Creating directory `.vscode` at #{workspace_path}...".colorize(:yellow)
    Dir.mkdir(workspace_path)
  end
end
