# encoding: utf-8
# author: Ben Vidulich

describe group('ben') do
  it { should exist }
end

describe user('ben') do
  it { should exist }
end

describe directory('/home/ben') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end

describe file('/home/ben/.bashrc') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end

describe file('/home/ben/.bash_profile') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end

describe file('/home/ben/.bash_custom') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end
