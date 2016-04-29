require 'spec_helper'

describe 'vim' do
  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_package('vim-package').with_ensure('present') }
  it { is_expected.to contain_file('vim-config') }
  it { is_expected.to contain_package('vim-puppet-package').with_ensure('present') }
  it { is_expected.to contain_package('vim-addon-manager-package').with_ensure('present') }
  it { is_expected.to contain_exec('enable-vim-puppet') }
end
