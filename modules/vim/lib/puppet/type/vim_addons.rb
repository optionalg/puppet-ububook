Puppet::Type.newtype(:vim_addons) do
  
  desc "Puppet type that manages the vim-addons script"
  
  ensurable
  
  newparam(:name, :namevar => true) do
    desc "Unique name of the plugin that should be installed"
  end

end
