module HelperMethods
  def all_identical?(array)
    array.all?{ |r| r == array.first }
  end
end
