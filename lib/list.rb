class List

  @@task_lists = []
  attr_reader(:description, :tasks, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @tasks = []
    @id = @@task_lists.length().+(1)
  end

  define_singleton_method(:all) do
    @@task_lists
  end

  define_singleton_method(:clear) do
    @@task_lists = []
  end

  define_method(:save) do
    @@task_lists.push(self)
  end

  define_method(:add_task_to_list) do |task_object|
    @tasks.push(task_object)
  end

end
