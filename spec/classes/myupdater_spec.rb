require 'spec_helper'

describe 'myupdater' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      context 'myupdater class should compile' do
        it { is_expected.to compile.with_all_deps }
      end

      it {
        is_expected.to contain_class('myupdater')
      }

      expected_file = ['/home/vagrant/yum_updated', '/tmp/file1', '/tmp/file31']
      expected_file.each do |file_val|
        it {
          is_expected.to contain_file(file_val)
            .with_ensure('present')
            .with_owner('vagrant')
            .with_group('vagrant')
        }
      end
    end
  end
end
