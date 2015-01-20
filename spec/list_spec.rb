require('rspec')
require('./lib/list')
# require("./lib/task")

describe(List) do

  describe(".all") do
    it("returns the class variable array of list objects") do
      test_list = List.new({ :description => "chores" })
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe(".clear") do
    it("clears out the class variable array") do
      test_list = List.new({ :description => "chores" })
      test_list.save()
      List.clear()
      expect(List.all()).to(eq([]))
    end
  end

  describe("#description") do
    it("returns the description of a task list") do
      test_list = List.new({:description => "chores"})
      expect(test_list.description()).to(eq("chores"))
    end
  end

  describe("#save") do
    it("pushes the list onject into the task_lists array") do
      test_list = List.new({ :description => "chores" })
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end


end
