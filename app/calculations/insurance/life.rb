module Calculations
  module Insurance
    class Life
      RATE = {
        (18..29) => 1.1,
        (30..59) => 1.4,
        (60..99) => 1.8
      }.freeze
      
      include PrioritizedCalculation
      priority 1

      def calculate(loan)
        age_range = RATE.keys.find {|range| range.include?(loan.client.age)}
        raise 'unsupported client age' if age_range.nil?

        loan.amount * (RATE[age_range] / 100.0) * loan.term
      end
    end
  end
end
