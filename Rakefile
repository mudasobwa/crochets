require 'bundler/setup'

require 'rspec/core/rake_task'

desc 'Tests'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.rspec_opts = '-Ispec'
  # spec.rcov = true
end

require 'cucumber/rake/task'
desc 'Cucumber'
Cucumber::Rake::Task.new(:features)

require 'yard'
desc 'Yard'
YARD::Rake::YardocTask.new(:yard) do |t|
  t.files   = ['**/*.rb', 'features/**/*.feature', 'features/**/*.rb']
end

task :default => :features
