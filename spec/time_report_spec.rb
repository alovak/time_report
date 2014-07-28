require 'spec_helper'

describe TimeReport do
  describe "#output" do
    it "returns tasks with time for each day" do
      input = <<-JSON
22.01
10:00 - 11:31 First task 1
11:40 - 12:00 Last task 2

21.01
06:00 - 08:00 First task 3
09:00 - 10:00 Last task 4
      JSON

      report = TimeReport::Processor.new(input)
      report.run

      expect(report.output).to eq(<<-OUT)
01:51 # 22.01
01:31 # First task 1
00:20 # Last task 2

03:00 # 21.01
02:00 # First task 3
01:00 # Last task 4

Perfecto!
      OUT
    end
  end
end
