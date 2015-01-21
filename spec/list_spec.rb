require("spec_helper")

describe(List) do
  describe(".all") do
    it("returns the class variable array of list objects") do
      test_list = List.new({ :description => "chores", :id => nil })
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe(".find") do
    it("returns a list by its ID number") do
      test_list = List.new({:description => "Epicodus stuff", :id => nil})
      test_list.save()
      test_list2 = List.new({:description => "Home stuff", :id => nil})
      test_list2.save()
      expect(List.find(test_list2.id())).to(eq(test_list2))
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

  describe("#tasks") do
    it("returns the task array for the list") do
    test_list = List.new({ :description => "chores", :id => nil})
    test_list.save()
    test_task = Task.new({ :description => "walk the dog", list_id => test_list.id })
    test_task.save()
    test_task2 = Task.new({ :description => "laundry", list_id => test_list.id })
    test_task2.save()
    expect(test_list.tasks()).to(eq([test_task, test_task2]))
    end
  end

end
