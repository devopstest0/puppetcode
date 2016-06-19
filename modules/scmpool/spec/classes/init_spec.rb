require 'spec_helper'
describe 'scmpool' do

  context 'with default values for all parameters' do
    it { should contain_class('scmpool') }
  end
end
