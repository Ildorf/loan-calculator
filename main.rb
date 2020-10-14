Encoding.default_external = Encoding::UTF_8
require_relative 'application.rb'

client = Client.new(age: 44, employment: :own_business)
loan_application = LoanApplication.new(
  loan_type: :business_development,
  insurances: :job,
  goods_cost: 30_000,
  downpayment: 3000,
  term: 12
)

LoanController.new(format: :text).create_loan(client, loan_application)


client = Client.new(age: 29, employment: :own_business)
loan_application = LoanApplication.new(
  loan_type: :business_development,
  insurances: [:life, :job],
  goods_cost: 30_000,
  downpayment: 3000,
  term: 12
)

LoanController.new(format: :html).create_loan(client, loan_application)
