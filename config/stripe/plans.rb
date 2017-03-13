Stripe.plan :silver do |plan|
  plan.name = 'ACME Silver'
  plan.amount = 699 # $6.99
  plan.interval = 'month'
end

Stripe.plan :gold do |plan|
  plan.name = 'ACME Gold'
  plan.amount = 999 # $9.99
  plan.interval = 'month'
end