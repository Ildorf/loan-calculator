class CreateLoanCommand
  def initialize
    @loan = Loan.new
  end

  def perform(client, application)
    fill_attributes(client, application)

    calculator = LoanCalculatorFactory.factory(@loan.type, @loan.insurances)
    calculator.calculate(@loan)
  end

  private

  def fill_attributes(client, application)
    @loan.client = client
    @loan.type = application.loan_type
    @loan.downpayment = application.downpayment
    @loan.insurances = application.insurances.is_a?(Array) ? application.insurances : [ application.insurances ]
    @loan.term = application.term
    @loan.insurance_amount = 0
    @loan.amount = application.goods_cost - @loan.downpayment
  end
end
