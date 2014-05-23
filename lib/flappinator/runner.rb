require 'childprocess'
require 'ruby-progressbar'
require 'forwardable'
require 'tempfile'

module Flappinator
  class Runner
    def self.start(options)
      @options = options

      progress_bar

      runs = @options.repetitions.times.map do |index|
        new(@options.command).tap do |runner|
          runner.run
          log(runner.output) if runner.failed?
          increment
        end
      end

      summarize(runs)
    end

    def self.progress_bar
      @progress_bar ||= ProgressBar.create(
        :title       => @options.command.join(' '),
        :total       => @options.repetitions,
        :format      => '%t %E %w'
      )
    end

    def self.log(output)
      output += "\n"
      progress_bar.log(output)
    end

    def self.increment
      # Work around a small display bug where intermittently the percentage
      # shown is one frame behind:
      sleep 0.1
      progress_bar.increment
    end

    def self.summarize(runs)
      puts "\nSuccess: #{runs.count(&:success?)}"
      puts "Failed: #{runs.count(&:failed?)}"
    end

    def initialize(command)
      @command = command
      @process = ChildProcess.build(*@command)
      @io = Tempfile.new('flappinator')
    end

    def run
      @process.io.stdout = @io
      @process.io.stderr = @io
      @process.start
      @process.wait
    end

    def output
      @io.close
      @io.open
      @io.read
    end

    def success?
      !@process.crashed?
    end

    def failed?
      @process.crashed?
    end
  end
end
