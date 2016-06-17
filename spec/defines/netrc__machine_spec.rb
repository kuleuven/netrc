require 'spec_helper'


describe 'netrc::machine' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({ 
            :concat_basedir => '/tmp', 
          })
        end
        
        
        context "netrc::machine with machine passed as title, path, login and password" do
          let(:title) do 
            'my_machine' 
          end

          let(:params) do
            {
              :path     => '/home/myuser/.netrc',
              :login    => 'myuser',
              :password => 'hunter2'
            }
          end

          it { is_expected.to compile.with_all_deps }

          it do 
            is_expected.to contain_concat__fragment('netrc_fragment_my_machine').with({
              'target' => '/home/myuser/.netrc' 
            }).with_content(/machine my_machine(\r|\n)(\s)*login myuser(\r|\n)(\s)*password hunter2/)
          end
        end


        context "netrc::machine with machine passed as title, netrc_path, login and password" do
          let(:title) do 
            'my_machine' 
          end

          let(:params) do
            {
              :netrc_path => '/home/myuser/.netrc',
              :login      => 'myuser',
              :password   => 'hunter2'
            }
          end

          it { is_expected.to compile.with_all_deps }

          it do 
            is_expected.to contain_concat__fragment('netrc_fragment_my_machine').with({
              'target' => '/home/myuser/.netrc' 
            }).with_content(/machine my_machine(\r|\n)(\s)*login myuser(\r|\n)(\s)*password hunter2/)
          end
        end

        context "netrc::machine where machine param overrides resource title" do
          let(:title) do 
            'my_machine' 
          end

          let(:params) do
            {
              :netrc_path => '/home/myuser/.netrc',
              :login      => 'myuser',
              :password   => 'hunter2',
              :machine    => 'some_other_machine',
            }
          end

          it { is_expected.to compile.with_all_deps }

          it do 
            is_expected.to contain_concat__fragment('netrc_fragment_some_other_machine').with({
              'target' => '/home/myuser/.netrc' 
            }).with_content(/machine some_other_machine(\r|\n)(\s)*login myuser(\r|\n)(\s)*password hunter2/)
          end
        end

        context "netrc::machine with no parameters" do
          let(:title) do 
            'my_machine' 
          end
          it { expect { is_expected.to contain_concat__fragment('netrc_fragment_my_machine') }.to raise_error(Puppet::Error, /expects a value for parameter|Must pass/) }
        end
      end
    end
  end
end
