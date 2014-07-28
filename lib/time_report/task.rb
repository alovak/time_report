class TimeReport::Task
  REG_EXP = /
  (?<start_hour>\d{1,2}):(?<start_minutes>\d{1,2})
  \s*-\s*
    (?<end_hour>\d{1,2}):(?<end_minutes>\d{1,2})
  \s+
    (?<description>.+)
  \z
  /x

  include TimeReport::Duration

  attr_reader :task_string

  def initialize(task_string)
    @task_string = task_string
  end

  def duration
    match = REG_EXP.match(task_string)

    if match
      start_hour = match[:start_hour].to_i
      start_minutes = match[:start_minutes].to_i

      end_hour = match[:end_hour].to_i
      end_minutes = match[:end_minutes].to_i

      (end_hour*60 + end_minutes) - (start_hour*60 + start_minutes)
    else
      0
    end
  end

  def description
    match = REG_EXP.match(task_string)

    if match
      match[:description]
    else
      "n/a"
    end
  end
end
