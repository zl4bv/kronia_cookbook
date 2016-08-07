# encoding: utf-8
# author: Ben Vidulich

describe package('tmux') do
  it { should be_installed }
end

describe file('/home/ben/.tmux.conf') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end

describe directory('/home/ben/.tmux/plugins/tpm') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end
