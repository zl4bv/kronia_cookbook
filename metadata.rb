name              'kronia'
maintainer        'Ben Vidulich'
maintainer_email  'ben@vidulich.co.nz'
license           'Apache 2.0'
description       'Cookbook to set up my workstation'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.0'

depends           'apt'
depends           'golang'
depends           'nodejs'
depends           'rvm'

%w(debian).each do |os|
  supports os
end
