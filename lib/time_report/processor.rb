class TimeReport::Processor
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def run
    parse
    generate
  end

  def output
    @output ||= ""
  end

  private

  def generate
    days.each do |day|
      output << "#{day.in_hours} # #{day.date}\n"
      day.tasks.each do |task|
        output << "#{task.in_hours} # #{task.description}\n"
      end
      output << "\n"
    end

    output << "Perfecto!\n"
  end

  def parse
    day = nil

    input.each_line do |line|
      line = line.chomp

      if date?(line)
        day = TimeReport::Day.new
        day.date = line
        add_day(day)

        next
      end

      if task?(line)
        day.add_task(line)
      end
    end
  end

  def add_day(day)
    days << day
  end

  def days
    @days ||= []
  end

  def date?(line)
    line =~ /\d{1,2}\.\d{1,2}/
  end

  def task?(line)
    line =~ TimeReport::Task::REG_EXP
  end
end
