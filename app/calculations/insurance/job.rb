module Calculations
  module Insurance
    class Job
      CLERK_RATE = 0.014.freeze
      
      include PrioritizedCalculation
      priority 0

      def calculate(loan)
        case loan.client.employment
        when :clerk
          loan.amount * CLERK_RATE
        when :own_business
          loan.amount / (1 - loan.term / 100.0 ) - loan.amount
        else
          raise 'unknow employment type'
        end
      end
    end
  end
end
