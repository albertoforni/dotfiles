require "./apps"

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

desc "Install Homebrew cask"
task :install_homebrew_cask do
  format {puts "\nInstall brew cask"}
  begin
    sh "brew install caskroom/cask/brew-cask"
  rescue Exception => exception
    color(RED) {puts exception}
  end
  format {puts "\nInstall software"}
  APPS.each do |software|
    color {puts "Install #{software}"}
    sh "brew cask install #{software}"
  end
end

desc "Setup your Mac"
task :setup => [:install_homebrew, :install_homebrew_cask]

desc "List of the tasks"
task :default do
  format { puts "\nList of the tasks\n" }
  verbose(false) do
    sh 'rake -T'
  end
end
