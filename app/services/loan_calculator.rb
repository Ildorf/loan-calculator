class LoanCalculator
  def initialize(monthly_payment_calculation:, insurance_calculations:)
    @monthly_payment_calculation = monthly_payment_calculation
    @insurance_calculations = insurance_calculations.sort_by(&:priority)
  end

  def calculate(loan)
    @insurance_calculations.each do |insurance_calculation|
      insurance_amount = insurance_calculation.calculate(loan)
      loan.insurance_amount += insurance_amount
      loan.amount += insurance_amount
    end
    loan.monthly_payment = @monthly_payment_calculation.calculate(loan)
    loan
  end
end
