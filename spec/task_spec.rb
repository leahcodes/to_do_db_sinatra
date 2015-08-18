require('spec_helper')

describe(Task) do

  describe(".all") do
    it("initializes an empty array to hold class variables later") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#description') do
    it('lets you read the description out') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :time => "2015-08-18"})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('#list_id') do
    it('lets you read the list ID out') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :time => "2015-08-18"})
        expect(test_task.list_id()).to(eq(1))
    end
  end

  describe('#time') do
    it('lets you read the time') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :time => "2015-08-18"})
        expect(test_task.time()).to(eq('2015-08-18'))
      end
    end

  describe("#save") do
    it('adds two tasks to the array of saved tasks') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :time => "2015-08-18"})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :time => "2015-08-18"})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :time => "2015-08-18"})
      expect(task1).to(eq(task2))
    end
  end

  describe(".clear") do
    it("clears out the tasks for a specific list") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :time => "2015-08-18"})
      Task.clear(1)
      expect(Task.all()).to(eq([]))
    end
  end


  # describe("#sort_ascending") do
  #   it("will sort the list based on time or date") do
  #     task1 = Task.new({:description => "Go to pool", :list_id => 1, :time => "2015-08-13"})
  #     task2 = Task.new({:description => "Go to school", :list_id => 1, :time => "2015-08-18"})
  #     expect(Task.sort_ascending()).to(eq([task2, task1]))
  #   end
  # end
  #
  # describe("sort_descending") do
  #   it("will sort the list based on time or date") do
  #     task1 = Task.new({:description => "Go to pool", :list_id => 1, :time => "2015-08-13"})
  #     task2 = Task.new({:description => "Go to school", :list_id => 1, :time => "2015-08-18"})
  #     expect(Task.all().sort_descending()).to(eq([task1, task2]))
  #   end
  # end
end
