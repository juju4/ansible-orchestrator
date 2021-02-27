require 'serverspec'

# Required by serverspec
set :backend, :exec

set ansible_path = '/usr/local/bin/ansible'
if (os[:family] == 'redhat' && os[:release] == '7')
  set ansible_path = '/usr/bin/ansible'
end

describe file(ansible_path) do
  it { should be_executable }
end

