require "./terminal_apps"
require "./apps"

$home = ENV['HOME']
raise "#{$home} is not a directory" if not File.directory? $home

RED = 31
GREEN = 32
def color(color=GREEN)
  printf "\033[#{color}m"
  yield
  printf "\033[0m"
end

BOLD = 1
ITALIC = 3
UNDERLINE = 4
def format(format=UNDERLINE)
  printf "\033[#{format}m"
  yield
  printf "\033[0m"
end

desc "Install Homebrew"
task :install_homebrew do
  if system('which brew')
    color(RED) { puts 'homebrew is already installed! Do you wanna update it? (y/n)' }
    resp = STDIN.gets.chomp
    if resp.downcase == 'y'
      sh 'brew update'
    end
  else
    sh 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  end
end

desc "Install Homebrew formulas"
task :install_homebrew_formulas do
  if system('which brew')
    format {puts "\nInstall software"}
    TERMINAL_APPS.each do |software|
      color {puts "Install #{software}"}
      sh "brew install #{software}"
    end
  else
    color(RED) { puts 'homebrew is not installed! Do you wanna install it? (y/n)' }
    if resp.downcase == 'y'
      Rake::Task["build"].invoke
    end
  end
end

desc "Install Homebrew cask"
task :install_homebrew_cask do
  format {puts "\nInstall brew cask"}
  begin
    sh "brew tap caskroom/cask"
  rescue Exception => exception
    color(RED) {puts exception}
  end
  format {puts "\nInstall software"}
  APPS.each do |software|
    color {puts "Install #{software}"}
    sh "brew cask install #{software}"
  end
end

desc "Install oh-my-zsh"
task :install_zsh do
  format {puts "\nInstall oh-my-zsh"}
  sh 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'

  format {puts "\nSetup .zshrc"}
  zshrc = File.join($home, '.zshrc')
  mv zshrc, File.join($home, '.zshrc.bak') if File.exists? zshrc
  ln_s File.join($home, 'bin', 'dotfiles', 'zsh', 'zshrc'), zshrc

  format {puts "\nInstall autosuggestions plugin"}
  sh "git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions" unless Dir.exists? File.join($home, '.oh-my-zsh/custom/plugins/zsh-autosuggestions')
  format {puts "\nRun \"source ~/.zshrc\" to get syntax-highlight working"}
end

desc "Setup your Mac"
task :setup => [:install_homebrew, :install_homebrew_cask, :install_zsh]

desc "List of the tasks"
task :default do
  format { puts "\nList of the tasks\n" }
  verbose(false) do
    sh 'rake -T'
  end
end
