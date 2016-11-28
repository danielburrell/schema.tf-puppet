require 'spec_helper'
describe 'schematf' do

  context 'with defaults for all parameters' do
    it { should contain_class('schematf') }
  end
end
