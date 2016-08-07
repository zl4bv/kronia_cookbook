# encoding: utf-8
# author: Ben Vidulich

describe package('docker.io') do
  it { should be_installed }
end

describe group('docker') do
  it { should exist }
end

describe service('docker') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
