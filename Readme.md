[Запустить](https://repl.it/@IldarSharifulli/LoanCalculator#main.rb)

### Дано:
Функция, выполняющая расчет стоимости кредита и выводящая результатаы на экран в текстовом формате. В связи с расширением бизнеса требуется дополнить функционал калькулятора.

### Задание:
1. Добавить возможность вывода результатов расчета в формате HTML (разметка на ваш выбор)
2. Реализовать возможность одновременной продажи страховки с типами :life и :job. В данном случае страховая премия для типа :life
должна быть рассчитана после того, как стоимость страховки с типом :job будет добавлена к сумме займа (loan_amount)
3. Провести рефакторинг на ваше усмотрение (задание со звездочкой)

```ruby
def calculation(client)
  loan_amount = client.goods_cost
  loan_amount = loan_amount - client.downpayment

  insurance_amount =
  case client.insurance
  when :life
    if client.age < 30
      loan_amount * (1.1 / 100.0) * client.term
     elsif client.age < 60
      loan_amount * (1.4 / 100.0) * client.term
    else
      loan_amount * (1.8 / 100.0) * client.term
    end
  when :job
    case client.employment
    when :own_business
      loan_amount / (1 - client.term / 100.0 ) - loan_amount
    when :clerk
      loan_amount * 0.014
    else
      0.00
    end
  else
    0.0
  end

  loan_amount += insurance_amount
  rate = 15 / 1200.0
  monthly_payment = rate * (rate + 1)**client.term / ((rate + 1)**client.term - 1) * loan_amount

  puts "Сумма займа: #{loan_amount.round(2)}"
  puts "Первоначальный взнос #{client.downpayment}"
  puts "Ежемесячный платеж: #{monthly_payment.round(2)}"
  puts "Срок кредита: #{client.term} месяцев"
  puts "Сумма выплат: #{(monthly_payment * client.term).round(2) }"
  puts "Страхование: #{client.insurance}, #{insurance_amount.round(2)}"
end


require 'ostruct'
person = OpenStruct.new(goods_cost: 30_000, downpayment: 3000, term: 12, age: 44, employment: :own_business,  insurance: :job)
calculation(person)
```
