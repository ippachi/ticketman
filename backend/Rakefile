# frozen_string_literal: true

require "rake/testtask"
require "rubocop/rake_task"
require "rubycritic/rake_task"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

RuboCop::RakeTask.new
RubyCritic::RakeTask.new do |task|
  task.options = "--format json"
end

task default: %i[test rubocop rubycritic]
