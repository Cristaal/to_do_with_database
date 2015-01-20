class List

  @@task_lists = []
  attr_reader(:description)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
  end

  define_singleton_method(:all) do
    @@task_lists
  end

  define_method(:save) do
    @@task_lists.push(self)
  end

  define_singleton_method(:clear) do
    @@task_lists = []
  end

end
