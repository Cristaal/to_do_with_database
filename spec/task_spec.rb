require("spec_helper")

describe(Task) do

  describe(".all") do
    it("is empty at first") do
     expect(Task.all()).to(eq([]))
    end
  end

  # describe(".clear") do
  #   it("clears out the task array") do
  #     test_task = Task.new({ :description => "Walk the dog." })
  #     test_task.save()
  #     Task.clear()
  #     expect(Task.all()).to(eq([]))
  #   end
  # end

  describe("#save") do
    it("saves task objects to the class variable array") do
      test_task = Task.new({ :description => "Walk the dog.", :list_id => 1 })
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#description") do
    it("returns the description of the task") do
      test_task = Task.new({ :description => "Walk the dog.", :list_id => 1  })
      expect(test_task.description()).to(eq("Walk the dog."))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1 })
      task2 = Task.new({:description => "learn SQL", :list_id => 1 })
      expect(task1).to(eq(task2))
    end
  end

  describe("list_id") do
    it("lets you read the list id out") do
      test_task = Task.new({ :description => "learn SQL", :list_id => 1 })
      expect(test_task.list_id()).to(eq(1))
    end
  end
end
