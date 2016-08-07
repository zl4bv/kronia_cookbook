# encoding: utf-8
# author: Ben Vidulich

describe package('terminator') do
  it { should be_installed }
end

describe file('/home/ben/.config/terminator/config') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end
