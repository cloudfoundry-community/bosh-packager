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
    def target_release
      require "bosh/packager/commands/target_release"
      cmd = Bosh::Packager::Commands::TargetRelease.new
      cmd.perform
    end

    usage "packager apply"
    desc "Apply a manifest/properties to targeted release"
    def apply_manifest
      require "bosh/packager/commands/apply_manifest"
      cmd = Bosh::Packager::Commands::ApplyManifest.new
      cmd.perform
    end
  end
end
