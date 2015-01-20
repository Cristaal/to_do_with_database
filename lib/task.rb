class Task
  @@tasks = []
  attr_reader(:description)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
  end

  define_singleton_method(:all) do
    @@tasks
  end

  define_method(:save) do
    @@tasks.push(self)
  end
end
