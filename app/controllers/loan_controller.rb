class LoanController
  def initialize(format: :text)
    @renderer = Renderer.new(format)
  end

  def create_loan(client, loan_application)
    loan = CreateLoanCommand.new.perform(client, loan_application)
    @loan = LoanPresenter.new(loan)

    @renderer.render('loan', 'create', binding)
  end
end
