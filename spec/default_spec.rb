require 'chefspec'

describe 'services::default' do
  let(:chef) do
    ChefSpec::ChefRunner.new
  end

  context "when the services attribute is an empty array" do
    before(:each) do
      chef.node.set['services'] = Array.new
      chef.converge 'services::default'
    end

    it 'should do nothing' do
      chef.should be_true
    end
  end

  context "when the services attribute is populated with a stop value" do
    before(:each) do
      chef.node.set['services'] = [ { :cups => [:stop] } ]
      chef.converge 'services::default'
    end

    it 'should stop the service' do
      chef.should stop_service 'cups'
    end
  end

  context "when the services attribute is populated with a start value" do
    before(:each) do
      chef.node.set['services'] = [ { :cups => [:start] } ]
      chef.converge 'services::default'
    end

    it 'should start the service' do
      chef.should start_service 'cups'
    end
  end

  context "when life is messy and we are stopping and disabling a service" do
    before(:each) do
      chef.node.set['services'] = [ { :cups => [:stop,:disable] } ]
      chef.converge 'services::default'
    end

    it 'should stop the service' do
      chef.should stop_service 'cups'
      # https://github.com/acrmp/chefspec/pull/67
      # chef.should disable_service 'cups'
    end
  end
end
