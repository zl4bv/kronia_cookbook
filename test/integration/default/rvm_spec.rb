# encoding: utf-8
# author: Ben Vidulich

describe group('rvm') do
  it { should exist }
end

describe file('/etc/rvmrc') do
  it { should exist }
end
