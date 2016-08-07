# encoding: utf-8
# author: Ben Vidulich

describe package('vim') do
  it { should be_installed }
end

describe file('/home/ben/.vimrc') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end

describe directory('/home/ben/.vim/bundle/vim-airline') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end

describe directory('/home/ben/.vim/bundle/vim-fugitive') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end

describe directory('/home/ben/.vim/bundle/tmuxline.vim') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end

describe directory('/home/ben/.vim/bundle/goyo.vim') do
  it { should exist }
  its('owner') { should eq 'ben' }
  its('group') { should eq 'ben' }
end
