module RatingDecorator
  def positivity
    if positive
      "You liked this map :)"
    else
      "You didn't like this map :("
    end
  end
end