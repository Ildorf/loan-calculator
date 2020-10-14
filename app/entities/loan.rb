Loan = Struct.new(
  :client,
  :amount,
  :total_amount,
  :downpayment,
  :monthly_payment,
  :term,
  :insurances,
  :insurance_amount,
  :type,
  keyword_init: true
)
