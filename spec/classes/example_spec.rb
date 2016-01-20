require 'spec_helper'

describe 'netrc' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end
        
        
        context "netrc class with credentials and user params" do
          let(:params) do
            {
              :credentials => [{'machine' => 'foo.com', 'login' => 'foobar', 'password' => 'hunter5'}],
              :user        => 'myuser',
            }
          end

          it { is_expected.to compile.with_all_deps }

          it do
            should contain_file('/home/myuser/.netrc').with({
              'mode' => '0600',
              'owner' => 'myuser',
            })
          end
        end

        context "netrc class with non-default user directory" do
          let(:params) do
            {
              :credentials => [{'machine' => 'foo.com', 'login' => 'foobar', 'password' => 'hunter5'}],
              :user        => 'otheruser',
              :user_dir    => '/users'
            }
          end

          it { is_expected.to compile.with_all_deps }

          it do
            should contain_file('/users/otheruser/.netrc').with({
              'mode' => '0600',
              'owner' => 'otheruser',
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
        }
      end
      
      let(:params) do
        {
          :credentials => [{'machine' => 'foo.com', 'login' => 'foobar', 'password' => 'hunter5'}]
        }
      end
      
      it { expect { should compile }.to raise_error(/Nexenta not supported/) }
    end
  end
end
