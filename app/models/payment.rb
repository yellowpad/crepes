class Payment < ApplicationRecord
	
	def do_deposit_transaction(type, stripe_token)
	  amount = Transaction.amount_for_type(type)
	  coupon = UserCoupon.coupon_for_amount(amount)

	  card = save_credit_card(stripe_token)
	  if deposited = deposit(amount, card)
	    subscribe if type == 'subscription'
	    create_coupon(coupon) if coupon

	    deposited
	  end
	end
	
	def deposit(amount, card)
	    customer = stripe_customer

	    Stripe::Charge.create(
	      amount: 500,
	      currency: 'usd',
	      customer: customer.id,
	      card: card.id,
	      description: "Charge for #{email}"
	    )

	    customer.account_balance += amount
	    customer.save
	rescue => e
	    false
	end

	def stripe_customer
    	Stripe::Customer.retrieve(stripe_customer_id)
	end

	# Set your secret key: remember to change this to your live secret key in production
	# See your keys here: https://dashboard.stripe.com/account/apikeys
	Stripe.api_key = "sk_test_npj2EvhDN6NsqKouOMHUTQ5i"

	# Token is created using Stripe.js or Checkout!
	# Get the payment token submitted by the form:
	token = params[:stripeToken]

	# Charge the user's card:
	charge = Stripe::Charge.create(
	  :amount => 1000,
	  :currency => "usd",
	  :description => "Example charge",
	  :source => token,
	)	
end
