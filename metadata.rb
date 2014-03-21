name              'patchman'
maintainer        'Christopher Coffey'
maintainer_email  'nomad@cybermerc.org'
license           'Apache 2.0'
description       'Setup OS patching configuration'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '1.0.0'

depends 'yum'
depends 'apt'
