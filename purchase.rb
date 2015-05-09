require 'active_merchant'

# Use the TrustCommerce test servers
ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
            :login => "temka_api.mail.ru",
    :password => "VWSHVUQ6Y5MFRZ3T",
    :signature => "AAwlp4y1CmlXHiV05s9diE3E4408ATEndGYVD5tNW3vc9blyMCh1S1GR"
  )

amount = 1000  # $10.00

# The card verification value is also known as CVV2, CVC2, or CID
credit_card = ActiveMerchant::Billing::CreditCard.new(
		:number             => '4032030518424511',
		:verification_value => '123',
		:month              => '4',
		:year               => Time.now.year+1,
                :first_name         => 'Nika',
                :last_name          => 'Islamova',                
                )

# Validating the card automatically detects the card type
if credit_card.validate.empty?
  # Capture $10 from the credit card
  response = gateway.purchase(amount, credit_card)

  if response.success?
    puts "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
  else
    raise StandardError, response.message
  end
end





