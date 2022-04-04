# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    self.max - self.min
  end

  def average
    return nil if self.length == 0
    self.sum * 1.0 / self.length
  end

  def median
    return nil if self.length == 0
    if self.length.odd?
        return self.sort[self.sort.length/2]
    else
        [self.sort[self.sort.length/2], self.sort[(self.sort.length/2)-1]].average
    end
  end   

  def counts
    count = Hash.new(0)
    self.each { |ele| count[ele]+=1 }
    count
  end

  def my_count(value)
    count = 0
    self.each { |ele| count += 1 if value == ele }
    count
  end

  def my_index(value)
    self.each_with_index { |ele, idx| return idx if value == ele } 
    nil
  end   

  def my_uniq
    new_array = []
    self.each {|ele| new_array << ele if !new_array.include?(ele) }
    new_array
  end

  def my_transpose
    new_array = []
    self.length.times { new_array << []}
    self.each_with_index do |miniArray, bigIndex|
        miniArray.each_with_index do |number, smallIndex|
            new_array[smallIndex][bigIndex] = self[bigIndex][smallIndex]
        end
    end
    new_array
  end

end