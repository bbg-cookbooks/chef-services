require 'chefspec'

describe 'services::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'services::default' }
  it 'should do something' do
    pending 'Your recipe examples go here.'
  end
end
