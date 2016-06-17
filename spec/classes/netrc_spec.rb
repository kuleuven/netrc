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
        

        
        context "netrc class with path and user parameters" do
          let(:params) do
            {
              :path => '/home/myuser/.netrc',
              :user => 'myuser'
            }
          end

          it { is_expected.to compile.with_all_deps }

          it do
            is_expected.to contain_concat('/home/myuser/.netrc').with({
              :ensure         => 'present',
              :owner          => 'myuser',
              :group          => 'myuser',
              :mode           => '0600',
              :warn           => true,
              :ensure_newline => true,
            })
          end
        end


        context "netrc class with path, user and group parameters" do
          let(:params) do
            {
              :path   => '/home/myuser/.netrc',
              :user   => 'myuser',
              :group  => 'some_group'
            }
          end

          it { is_expected.to compile.with_all_deps }

          it do
            is_expected.to contain_concat('/home/myuser/.netrc').with({
              :ensure         => 'present',
              :owner          => 'myuser',
              :group          => 'some_group',
              :mode           => '0600',
              :warn           => true,
              :ensure_newline => true,
            })
          end
        end

        context "netrc class with no parameters" do
          it { expect { is_expected.to contain_concat('/home/my/user/.netrc') }.to raise_error(Puppet::Error, /expects a value for parameter|Must pass/ ) }
        end
      end
    end
  end
end
