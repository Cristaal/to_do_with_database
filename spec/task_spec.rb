require('rspec')
require('./lib/task')


describe(Task) do

  describe(".all") do
    it("is empty at first") do
     expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves task objects to the class variable array") do
      test_task = Task.new({ :description => "Walk the dog." })
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#description") do
    it("returns the description of the task") do
      test_task = Task.new({ :description => "Walk the dog." })
      expect(test_task.description()).to(eq("Walk the dog."))
    end
  end


end
