require 'spec_helper'

describe 'netrc' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end
        
        let(:params) do
          {
            :credentials => [{'machine' => 'foo.com', 'login' => 'foobar', 'password' => 'hunter5'}]
          }
        end
        
        context "netrc class with credentials array" do
          it { is_expected.to compile.with_all_deps }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'netrc class on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end
      
      let(:params) do
        {
          :credentials => [{'machine' => 'foo.com', 'login' => 'foobar', 'password' => 'hunter5'}]
        }
      end
      
      it { expect { should compile }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
