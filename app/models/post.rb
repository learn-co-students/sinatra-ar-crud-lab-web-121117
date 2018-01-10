#Placeholder for a model
class Post < ActiveRecord::Base



  def name_with_id
    "#{self.id}. #{self.name}. #{self.content}"
  end
end
