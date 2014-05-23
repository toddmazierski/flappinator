require_relative 'flappinator/options'
require_relative 'flappinator/runner'

module Flappinator
  def self.start(args)
    options = Flappinator::Options.new(args)
    options.parse!

    Flappinator::Runner.start(options)
  end
end
