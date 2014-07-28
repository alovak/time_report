class TimeReport::Day
  include TimeReport::Duration

  attr_accessor :date

  def initialize
  end

  def add_task(task)
    tasks << TimeReport::Task.new(task)
  end

  def tasks
    @tasks ||= []
  end

  def duration
    tasks.inject(0) { |sum, task| sum + task.duration }
  end
end
