require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  def test_create
    t = FactoryGirl.build(:task)
    assert t.save
  end

  def test_done
    t = FactoryGirl.build(:task)
    assert t.save
    assert t.mark_done
    assert t.done?
  end

  def test_undone
    t = FactoryGirl.build(:task)
    assert t.save
    assert t.mark_undone
    assert_not t.done?
  end

end
