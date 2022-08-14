module Enumerable
  def my_each_with_index
    i = 0
    self.each do |content|
      yield content, i
      i += 1
    end
    return self
  end

  def my_select
    arr = []
    self.each do |content|
      if (yield content)
        arr << content
      end
    end
    return arr
  end

  def my_all?
    self.each do |content|
      if !(yield content)
        return false
      end
    end
    return true
  end

  def my_any?
    self.each do |content|
      if (yield content)
        return true
      end
    end
    return false
  end

  def my_none?
    self.each do |content|
      if (yield content)
        return false
      end
    end
    return true
  end

  def my_count
    count = 0
    block_given? ? self.each { |content| count += 1 if (yield content) } : count = self.length 
    # Look, I tried shorthanded if
    return count
  end

  def my_map
    i = 0
    arr = []
    while i < self.length
      arr << yield(self[i])
      i += 1
    end
    return arr
  end

  def my_inject(initial)
    calc = initial
    self.each do |content|
      calc = yield content, calc
    end
    return calc
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    return self
  end
    
end
