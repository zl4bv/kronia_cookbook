# encoding: utf-8
# author: Ben Vidulich

describe package('i3') do
  it { should be_installed }
end

describe file('/home/ben/.i3/config') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end

describe file('/home/ben/.i3status.conf') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end
