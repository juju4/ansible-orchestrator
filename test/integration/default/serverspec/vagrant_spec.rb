require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/usr/bin/vagrant') do
  it { should be_executable }
end

describe command('vagrant plugin list') do
  its(:stdout) { should match /scp/ }
  its(:stdout) { should match /winrm/ }
  its(:stdout) { should match /digitalocean/ }
  its(:stdout) { should match /aws/ }
  its(:stdout) { should match /vsphere/ }
end

