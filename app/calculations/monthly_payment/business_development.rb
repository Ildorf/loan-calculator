module Calculations
  module MonthlyPayment
    class BusinessDevelopment
      RATE = (15 / 1200.0).freeze

      def calculate(loan)
        RATE * (RATE + 1) ** loan.term / ((RATE + 1) ** loan.term - 1) * loan.amount
      end
    end
  end
end
