# encoding: utf-8
# author: Ben Vidulich

describe file('/etc/profile.d/golang.sh') do
  it { should exist }
end
