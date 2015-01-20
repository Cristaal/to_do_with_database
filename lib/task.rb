class Task
  @@tasks = []
  attr_reader(:description, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id = @@tasks.length().+(1)
  end

  define_singleton_method(:all) do
    @@tasks
  end

  define_singleton_method(:clear) do
    @@tasks = []
  end

  define_method(:save) do
    @@tasks.push(self)
  end
end
