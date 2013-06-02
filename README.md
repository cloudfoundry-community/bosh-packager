# Bosh::Packager

Apply a bosh release to the local bosh stemcell from a target bosh director/blobstore.

STATUS: Just a readme

## Installation

Install it yourself using RubyGems & Ruby 1.9.3+:

```
$ gem install bosh-packager
```

## Usage

```
$ bosh-packager target BOSH_DIRECTOR_URI appcloud
Username: drnic
Password: ***************
$ bosh-packager apply path/to/manifest.yml [--stemcell-name bosh-stemcell] [--stemcell-version 666] \
    [--release-version 131] [--nostart] \
    [--local-blobstore /var/vcap/micro/data/cache] \
    [--local-apply-spec /var/vcap/micro/apply_spec.yml]
```

The `manifest.yml` contains the list of jobs to be installed & run (including their dependent compiled packages).


## What happens?

The `bosh-packager apply` command requests from the bosh director the "job spec" for the targeted release (in example above it is `appcloud`, release number 131) for a specific stemcell (`bosh-stemcell`, version 666 in example above). It receives the references to the director's blobstore for the job templates and compiled package blobs. These blobs are downloaded to a local blobstore (on the filesystem defaulting to `/var/vcap/micro/data/cache`).

The job spec is combined with the `manifest.yml` to create a local `apply_spec.yml` file. The local `bosh_agent` is then sent the `release_apply_spec` message (unless `--nostart` flag).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
