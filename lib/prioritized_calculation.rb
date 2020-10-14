module PrioritizedCalculation
  def self.included(base)
    base.extend(ClassMethods)
  end

  def priority
    self.class.calculation_priority
  end

  module ClassMethods
    def priority(value)
      @priority = value
    end

    def calculation_priority
      @priority
    end
  end
end
