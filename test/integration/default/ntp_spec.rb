# encoding: utf-8
# author: Ben Vidulich

describe package('ntp') do
  it { should be_installed }
end

describe service('ntp') do
  it { should be_installed }
  it { should be_running }
end
