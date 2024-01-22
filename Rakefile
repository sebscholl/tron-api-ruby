# frozen_string_literal: true

require "bundler/gem_tasks"
require "rubocop/rake_task"
require "rspec/core/rake_task"

# Run RuboCop
RuboCop::RakeTask.new

# Run RSpec code examples
RSpec::Core::RakeTask.new(:spec)

task default: :spec
task default: :rubocop
