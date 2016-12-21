default['kronia']['user_name'] = 'ben'
default['kronia']['user_full_name'] = 'Ben Vidulich'
default['kronia']['user_email'] = 'ben@vidulich.co.nz'

case node['platform_family']
when 'debian'
  default['kronia']['user_home'] = '/home/ben'
when 'mac_os_x'
  default['kronia']['user_home'] = '/Users/ben'
end

default['kronia']['group_name'] = 'ben'
