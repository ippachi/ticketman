# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `version_gem` gem.
# Please instead update this file by running `bin/tapioca gem version_gem`.

module VersionGem; end

module VersionGem::Api
  def major; end
  def minor; end
  def patch; end
  def pre; end
  def to_a; end
  def to_h; end
  def to_s; end

  private

  def _to_a; end
end

module VersionGem::Basic
  class << self
    def extended(base); end
  end
end

class VersionGem::Error < ::RuntimeError; end

module VersionGem::Version
  extend ::VersionGem::Basic
  extend ::VersionGem::Api
end

VersionGem::Version::VERSION = T.let(T.unsafe(nil), String)
