require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require 'rubocop/rake_task'

desc 'Create tasks to run unit tests'
RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--display-cop-names']
end

RSpec::Core::RakeTask.new(:unit) do |t|
  t.pattern = './spec/{,/*/**}/*_spec.rb'
end


desc 'Create tasks to run integration tests'

RSpec::Core::RakeTask.new(:integration) do |t|
  t.pattern = './spec/integration/{,/*/**}/*_spec.rb'
end

Cucumber::Rake::Task.new

desc 'Default: run specs and generate metrics'

namespace :coverage do
  desc ""
  task :rubocop do
    Rake::Task['rubocop'].invoke
  end

  task :integration do
    ENV["COVERAGE"] = "disable"
    Rake::Task['integration'].invoke
  end

  desc ""
  task :unit do
    ENV["COVERAGE"] = "enable"
    Rake::Task['unit'].invoke
  end

  task :feature do
    ENV["COVERAGE"] = "enable"
    sh 'cucumber'
  end
end

task :default => ["coverage:rubocop", "coverage:unit", "coverage:integration", "coverage:feature"]
