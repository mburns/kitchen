require 'rubocop/rake_task'
require 'foodcritic'

# Style tests. Rubocop and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = {
      fail_tags: ['any']
    }
  end
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

desc 'Runit chefspec unit tests'
task :unit do
  sh "bundle exec 'rspec ./test/unit/spec/ --color --format documentation'"
end

begin
  require 'kitchen'
  namespace :integration do
    desc 'Run Test Kitchen with Vagrant'
    task :vagrant do
      Kitchen.logger = Kitchen.default_file_logger
      Kitchen::Config.new.instances.each do |instance|
        instance.test(:always)
      end
    end
  end
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks'
end

task ci: %w(style unit)

# Default
task default: %w(style unit integration:vagrant)
