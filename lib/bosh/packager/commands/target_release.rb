require "bosh/packager"

module Bosh::Packager::Commands
  class TargetRelease
    attr_accessor :director_client
    attr_accessor :release_name

    def initialize(director_client)
      @director_client = director_client
    end

    # Checks with director that release_name exists
    def release
      @release ||= director_client.list_releases.find { |rel| rel["name"] == release_name }
    end
    alias :release_exists? :release

    def perform
      
    end
  end
end
