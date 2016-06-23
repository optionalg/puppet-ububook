require 'spec_helper'

describe 'tmux' do
  let(:local_user) {'tmolnar'}
  
  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_package('tmux-package').with_ensure('present') }
  it { is_expected.to contain_file('tmux-config').with(
    'ensure' => 'file',
    'path'   => '/home/tmolnar/.tmux.conf',
    'source' => 'puppet:///modules/tmux/.tmux.conf',
    'mode'   => '0644',
    'owner'  => 'tmolnar',
    'group'  => 'tmolnar'
  ) }
end
