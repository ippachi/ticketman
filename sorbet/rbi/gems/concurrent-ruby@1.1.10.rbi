# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `concurrent-ruby` gem.
# Please instead update this file by running `bin/tapioca gem concurrent-ruby`.

# {include:file:README.md}
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#1
module Concurrent
  extend ::Concurrent::Utility::EngineDetector
end

# A thread-safe subclass of Hash. This version locks against the object
# itself for every method call, ensuring only one thread can be reading
# or writing at a time. This includes iteration methods like `#each`,
# which takes the lock repeatedly when reading an item.
#
# @see http://ruby-doc.org/core/Hash.html Ruby standard library `Hash`
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/hash.rb#56
class Concurrent::Hash < ::Hash; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/hash.rb#16
Concurrent::HashImplementation = Hash

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#4
module Concurrent::ThreadSafe; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#7
module Concurrent::ThreadSafe::Util; end

# TODO (pitr-ch 15-Oct-2016): migrate to Utility::ProcessorCounter
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#13
Concurrent::ThreadSafe::Util::CPU_COUNT = T.let(T.unsafe(nil), Integer)

# TODO (pitr-ch 15-Oct-2016): migrate to Utility::NativeInteger
#
# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#10
Concurrent::ThreadSafe::Util::FIXNUM_BIT_SIZE = T.let(T.unsafe(nil), Integer)

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/thread_safe/util.rb#11
Concurrent::ThreadSafe::Util::MAX_INT = T.let(T.unsafe(nil), Integer)

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#2
module Concurrent::Utility; end

# source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#5
module Concurrent::Utility::EngineDetector
  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#14
  def on_cruby?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#6
  def on_jruby?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#10
  def on_jruby_9000?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#34
  def on_linux?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#30
  def on_osx?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#18
  def on_rbx?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#22
  def on_truffleruby?; end

  # @return [Boolean]
  #
  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#26
  def on_windows?; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#38
  def ruby_engine; end

  # source://concurrent-ruby//lib/concurrent-ruby/concurrent/utility/engine.rb#42
  def ruby_version(version = T.unsafe(nil), comparison, major, minor, patch); end
end
