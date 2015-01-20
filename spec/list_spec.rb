require('rspec')
require('./lib/list')
require("./lib/task")
require("pg")

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

describe(List) do
  describe(".all") do
    it("returns the class variable array of list objects") do
      test_list = List.new({ :description => "chores", :id => nil })
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  # describe(".clear") do
  #   it("clears out the class variable array") do
  #     test_list = List.new({ :description => "chores", :id => nil })
  #     test_list.save()
  #     List.clear()
  #     expect(List.all()).to(eq([]))
  #   end
  #end

  describe("#id") do
    it("returns the id of the task") do
      test_list = List.new({ :description => "chores", :id => nil})
      test_list.save()
      expect(test_list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#description") do
    it("returns the description of a task list") do
      test_list = List.new({:description => "chores", :id => nil})
      expect(test_list.description()).to(eq("chores"))
    end
  end

  describe("#save") do
    it("pushes the list onject into the task_lists array") do
      test_list = List.new({ :description => "chores", :id => nil })
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  # describe("#add_task_to_list") do
  #   it("adds the task object passed to it into the task array of the list it is called on") do
  #     test_list = List.new({ :description => "chores", :id => nil })
  #     test_list.save()
  #     test_task = Task.new({ :description => "Walk the dog." })
  #     test_task.save()
  #     test_list.add_task_to_list(test_task)
  #     expect(test_list.tasks()).to(eq([test_task]))
  #   end
  # end

  # describe("#tasks") do
  #   it("returns the task object array") do
  #   test_list = List.new({ :description => "chores", :id => nil})
  #   test_list.save()
  #   test_task = Task.new({ :description => "walk the dog" })
  #   test_task.save()
  #   test_list.add_task_to_list(test_task)
  #   expect(test_list.tasks()).to(eq([test_task]))
  #   end
  # end

end
