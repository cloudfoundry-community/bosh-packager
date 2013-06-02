# Copyright (c) 2013 Stark & Wayne, LLC

require "bosh/packager"

module Bosh::Cli::Command
  class Packager < Base
    usage "packager"
    desc  "show packager sub-commands"
    def help
      say("bosh packager sub-commands:")
      nl
      cmds = Bosh::Cli::Config.commands.values.find_all {|c|
        c.usage =~ /^packager/
      }
      Bosh::Cli::Command::Help.list_commands(cmds)
    end

    usage "packager release"
    desc "Target specific release that will be packaged locally"
    def target_release(name)
      require "bosh/packager/commands/target_release"
      cmd = Bosh::Packager::Commands::TargetRelease.new
      cmd.release_name = name
      cmd.perform
    end

    # $ bosh packager apply path/to/manifest.yml [--stemcell-name bosh-stemcell] [--stemcell-version 666] \
    #     [--release-version 131] [--nostart] \
    #     [--local-blobstore /var/vcap/micro/data/cache] \
    #     [--local-apply-spec /var/vcap/micro/apply_spec.yml]
    usage "packager apply"
    desc "Apply a manifest/properties to targeted release"
    option "--stemcell-name NAME", String, "stemcell equivalent to local server [bosh-stemcell]"
    option "--stemcell-version NUMBER", Integer, "specific stemcell version equivalent to local server [latest]"
    option "--local-blobstore DIR", String, "override local blobstore location [/var/vcap/micro/data/cache]"
    option "--local-apply-spec FILE", String, "override local apply_spec.yml location [/var/vcap/micro/apply_spec.yml]"
    option "--nostart", "only create local blobstore cache; but do not start jobs"
    def apply_manifest(manifest_file)
      options[:local_blobstore] ||= "/var/vcap/micro/data/cache"
      options[:local_apply_spec] ||= "/var/vcap/micro/apply_spec.yml"
      options[:stemcell_name] ||= "bosh-stemcell"
      p options
      require "bosh/packager/commands/apply_manifest"
      cmd = Bosh::Packager::Commands::ApplyManifest.new
      cmd.perform
    end
  end
end
