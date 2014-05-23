require 'optparse'

module Flappinator
  class Options
    attr_reader :command,
                :repetitions

    def initialize(args)
      @args = args
      @command = []
      @repetitions = 25
    end

    def parse!
      # Duplicate the arguments, as parsing is destructive.
      args = @args.dup
      parser.parse!(args)
      # Assign the remaining unparsed arguments (the COMMAND).
      @command = args
      raise ArgumentError if @command.empty?
    end

  private

    def parser
      OptionParser.new do |parser|
        parser.banner = 'Usage: flappinator [ options ] COMMAND'

        parser.on('-r', '--repetitions=TIMES', Integer, 'Number of repetitions') do |times|
          @repetitions = times
        end

        parser.on_tail('-h', '--help', 'Show this message') do
          puts parser
          exit
        end
      end
    end
  end
end
