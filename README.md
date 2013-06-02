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
    [--release-version 131] [--nostart] [--local-blobstore /var/vcap/appcloud/data/cache]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
