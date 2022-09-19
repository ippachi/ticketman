# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `ulid` gem.
# Please instead update this file by running `bin/tapioca gem ulid`.

# source://ulid//lib/ulid/version.rb#1
module ULID
  extend ::ULID::Generator
end

# source://ulid//lib/ulid/generator.rb#10
module ULID::Generator
  # source://ulid//lib/ulid/generator.rb#20
  def generate(time = T.unsafe(nil)); end

  # source://ulid//lib/ulid/generator.rb#26
  def generate_bytes(time = T.unsafe(nil)); end

  private

  # source://ulid//lib/ulid/generator.rb#32
  def encode(input, length); end

  # source://ulid//lib/ulid/generator.rb#45
  def octo_word(time = T.unsafe(nil)); end

  # source://ulid//lib/ulid/generator.rb#66
  def random_bytes; end

  # source://ulid//lib/ulid/generator.rb#50
  def time_48bit(time = T.unsafe(nil)); end
end

# source://ulid//lib/ulid/generator.rb#15
ULID::Generator::BITS_PER_B32_CHAR = T.let(T.unsafe(nil), Integer)

# source://ulid//lib/ulid/generator.rb#14
ULID::Generator::BIT_LENGTH = T.let(T.unsafe(nil), Integer)

# source://ulid//lib/ulid/generator.rb#13
ULID::Generator::ENCODED_LENGTH = T.let(T.unsafe(nil), Integer)

# Crockford's Base32
#
# source://ulid//lib/ulid/generator.rb#11
ULID::Generator::ENCODING = T.let(T.unsafe(nil), Array)

# source://ulid//lib/ulid/generator.rb#18
ULID::Generator::MASK = T.let(T.unsafe(nil), Integer)

# source://ulid//lib/ulid/generator.rb#12
ULID::Generator::RANDOM_BYTES = T.let(T.unsafe(nil), Integer)

# source://ulid//lib/ulid/generator.rb#16
ULID::Generator::ZERO = T.let(T.unsafe(nil), Integer)

# source://ulid//lib/ulid/version.rb#2
ULID::VERSION = T.let(T.unsafe(nil), String)