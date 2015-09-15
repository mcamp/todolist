class Task
  include MongoMapper::Document

  belongs_to :user
  
  key :description, String
  key :done,        Boolean, default: false

  def mark_done
    self.done = true
    return self.save
  end

  def mark_undone
    self.done = false
    return self.save
  end

end
