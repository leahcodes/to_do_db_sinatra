require('spec_helper')

describe(List) do

  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same list if it has the same name') do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe('#id') do
    it('sets its ID when you save it') do
      list = List.new({:name => "Epicorgis", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
  it("returns a list by its ID") do
    test_list = List.new({:name => "Your List", :id => nil})
    test_list.save()
    test_list2 = List.new({:name => "Moar Lists", :id => nil})
    test_list2.save()
    expect(List.find(test_list2.id())).to(eq(test_list2))
  end
 end

  describe('#tasks') do
   it("returns an arry of tasks for the list") do
     test_list = List.new({:name => "Epicorgis", :id => nil})
     test_list.save()
     test_task = Task.new({:description => "walk the corgi", :list_id => test_list.id(), :time => '2015-08-18'})
     test_task.save()
     test_task2 = Task.new({:description => "feed the corgi", :list_id => test_list.id(), :time => '2015-08-18'})
     test_task2.save()
     expect(test_list.tasks()).to(eq([test_task, test_task2]))
   end
 end

  describe('#update') do
    it('allows a user to udpate information in the lists database') do
      test_list = List.new({:name => "Epicorgis", :id => nil})
      test_list.save()
      test_list.update({:name => "Epicbutts"})
      expect(test_list.name()).to(eq("Epicbutts"))
    end
  end


end
