# encoding: utf-8
# author: Ben Vidulich

describe package('git') do
  it { should be_installed }
end

describe file('/home/ben/.gitconfig') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end
