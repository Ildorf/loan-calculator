class String
  def classify
    split('_').collect!{ |w| w.capitalize }.join
  end

  def constantize
    Object.const_get(self)
  end
end
