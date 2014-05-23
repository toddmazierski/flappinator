require_relative 'flappinator/options'

module Flappinator
  def self.start(options)
    puts "Repeating #{options.command.join(' ')} #{options.repetitions} times"
  end
end
