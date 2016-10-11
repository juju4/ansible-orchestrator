require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/usr/bin/ansible') do
  it { should be_executable }
end

