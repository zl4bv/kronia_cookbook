default['rvm']['default_ruby']  = 'ruby-2.3'
default['rvm']['rubies']        = %w(ruby-2.3)
default['rvm']['global_gems']   = [{ 'name' => 'bundler' },
                                   { 'name' => 'rake' },
                                   { 'name' => 'rubocop' }]
