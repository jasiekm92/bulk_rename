require 'fileutils'

class ChangeMachine
  def initialize(source, destination, name_pattern, format)
    @source = source
    @destination = destination
    @name_pattern = name_pattern
    @format = format.delete('.') # if typed eg. '.png'
  end

  def copy
    Dir[@source + "/*.{#{@format}}"].each do |old_dir|
      new_dir = old_dir.gsub(@source, @destination)
      FileUtils.mkdir_p(File.dirname(new_dir))
      FileUtils.cp(old_dir, new_dir)
    end
  end

  def rename
    Dir.chdir(@destination)
    folder = Dir[@destination + "/*.{#{@format}}"]
    counter = 0
    folder.each do |old_name|
      new_name = @name_pattern + counter.to_s + '.' + @format
      File.rename(old_name, new_name)
      counter += 1
    end
  end

  def start
    self.copy
    self.rename
    puts
    puts 'DONE! New directory: ' + @destination
  end
end