# encoding: utf-8
# author: Ben Vidulich

describe package('fonts-crosextra-carlito') do
  it { should be_installed }
end

describe file('/usr/share/fonts/powerline-fonts/README.rst') do
  it { is_expected.to exist }
end
