require 'spec_helper'

describe TimeReport::Task do
  def task(line)
    TimeReport::Task.new(line)
  end

  describe "TimeReport::Task::REG_EXP" do
    it "matches all task strings" do
      expect("10:00 - 12:40 Task description").to match(TimeReport::Task::REG_EXP)
      expect("o 10:00 - 12:40 Task description").to match(TimeReport::Task::REG_EXP)
    end
  end

  describe "#duration" do
    it "returns duration in minutes" do
      expect(task("10:00 - 12:40 Task description").duration).to be(160)
      expect(task("1:00 - 2:40 Task description").duration).to be(100)
    end
  end

  describe "#description" do
    it "returns description" do
      expect(task("10:00 - 12:40 Task description").description).to eq("Task description")
    end
  end
end
