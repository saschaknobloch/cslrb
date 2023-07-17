# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'thermite/tasks'

Thermite::Tasks.new

desc 'Run Rust & Ruby testsuites'
task test: ['thermite:build', 'thermite:test', 'spec']
