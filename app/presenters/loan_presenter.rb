class LoanPresenter
  def initialize(subject)
    @subject = subject
  end

  attr_reader :subject

  def type
    Locales::LOAN[subject.type]
  end

  def amount
    subject.amount.round(2)
  end

  def downpayment
    subject.downpayment.round(2)
  end

  def monthly_payment
    subject.monthly_payment.round(2)
  end

  def term
    subject.term
  end

  def payment
    (subject.monthly_payment * subject.term).round(2)
  end

  def insurances
    subject.insurances.map {|insurance| Locales::INSURANCE[insurance] }.join(', ')
  end

  def insurance_amount
    subject.insurance_amount.round(2)
  end
end
