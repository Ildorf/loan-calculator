class LoanCalculatorFactory
  def self.factory(loan_type, insurance_types)
    insurances = insurance_calculations(insurance_types)
    monthly_payment = monthly_payment_calculation(loan_type)
    LoanCalculator.new(monthly_payment_calculation: monthly_payment, insurance_calculations: insurances)
  end

  def self.insurance_calculations(insurance_types)
    insurance_types.map do |insurance|
      insurance_calculation = "Calculations::Insurance::#{insurance.to_s.classify}"
      raise 'unsupported insurance type' unless const_defined?(insurance_calculation)

      insurance_calculation.constantize.new
    end
  end

  def self.monthly_payment_calculation(loan_type)
    monthly_payment = "Calculations::MonthlyPayment::#{loan_type.to_s.classify}"
    raise 'unsupported loan type' unless const_defined?(monthly_payment)

    monthly_payment.constantize.new
  end
end
