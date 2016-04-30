require 'spec_helper'

describe 'tmux' do
  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_package('tmux-package').with_ensure('present') }
  it { is_expected.to contain_file('tmux-config') }
end
