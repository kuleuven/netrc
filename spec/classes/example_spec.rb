require 'spec_helper'


describe 'netrc' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({ 
            :concat_basedir => '/tmp', 
          })
        end
        
        
        context "netrc class with user and path" do
          let(:params) do
            {
              :path => '/home/myuser/.netrc',
              :user => 'myuser',
            }
          end

          it { is_expected.to compile.with_all_deps }

          it do
            should contain_concat('/home/myuser/.netrc').with({
              'mode'  => '0600',
              'owner' => 'myuser',
              'group' => 'myuser'
            })
          end
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
          :concat_basedir  => '/tmp',
        }
      end
      
      let(:params) do
        {
          :path => '/home/myuser/.netrc',
          :user => 'myuser',
        }
      end
      
      it { expect { should compile }.to raise_error(/Nexenta not supported/) }
    end
  end
end
