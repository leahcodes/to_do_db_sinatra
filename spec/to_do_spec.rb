require('rspec')
require('to_do')

describe(Task) do
  describe('#description') do
    it('lets you give it a description') do
      test_task = Task.new("acquire benjamins")
      expect(test_task.description()).to(eq("acquire benjamins"))
    end
  end

  describe(".all") do
    it("initializes an empty array to hold class variables later") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('adds two tasks to the array of saved tasks') do
      test_task = Task.new('do laundry naked')
      test_task.save()
      test_task_two = Task.new('pick up dog shit')
      test_task_two.save()
      expect(Task.all()).to(eq([test_task, test_task_two]))
    end
  end

  describe(".clear") do
    it("clears out all saved tasks in the all tasks array") do
      Task.new("Appease the gods").save()
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end
end
