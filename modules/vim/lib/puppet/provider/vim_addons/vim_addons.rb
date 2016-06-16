Puppet::Type.type(:vim_addons).provide(:vim_addons) do

  commands :vim_addons => 'vim-addons'

  def is_installed(plugin)
    begin
      output = vim_addons(['status', plugin])
    rescue
      Puppet.debug("#is_installed ran on error: #{e.inspect}")
      return nil
    end
    return true if output.split("\n")[1] =~ /installed/i
  end

  def exists?
    is_installed(resource[:name]) != nil
  end

  def create
    vim_addons(['-w', 'install', resource[:name]])
  end

  def destroy
    vim_addons(['-w', 'remove', resource[:name]])
  end

end
