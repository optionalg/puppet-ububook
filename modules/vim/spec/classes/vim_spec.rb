require 'spec_helper'

describe 'vim' do
  let(:local_user) {'tmolnar'}

  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_package('vim-package').with_ensure('present') }
  it { is_expected.to contain_file('vim-config').with(
    'ensure'  => 'file',
    'path'    => '/home/tmolnar/.vimrc',
    'source'  => 'puppet:///modules/vim/.vimrc',
    'mode'    => '0644',
    'owner'   => 'tmolnar',
    'group'   => 'tmolnar'
  ) }
  it { is_expected.to contain_package('vim-puppet-package').with_ensure('present') }
  it { is_expected.to contain_package('vim-addon-manager-package').with_ensure('present') }
  it { is_expected.to contain_exec('enable-vim-puppet') }

  context 'with vim_for_root => enable' do
    let(:vim_for_root) { 'enable' }

    it { is_expected.to contain_file('vim-config-root').with(
      'ensure'  => 'file',
      'path'    => '/root/.vimrc',
      'source'  => 'puppet:///modules/vim/.vimrc',
      'mode'    => '0644',
      'owner'   => 'root',
      'group'   => 'root'
    ) }
  end
end
