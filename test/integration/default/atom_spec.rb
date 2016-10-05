# encoding: utf-8
# author: Ben Vidulich

%w(libnspr4
   libnss3
   xdg-utils
   libnotify4
   gvfs-bin
   libdbus-glib-1-2
   gconf2-common
   libgconf-2-4
   gconf-service
   gconf2
   libgtk2.0-0
   atom).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe file('/home/ben/.atom-packages.txt') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end

describe directory('/home/ben/.atom') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end
