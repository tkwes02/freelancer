class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
      belongs_to :plan
      has_one :profile
       
      
    Stripe.api_key = ENV["STRIPE_API_KEY"]
              attr_accessor :stripe_card_token
          def save_with_subscription
            if valid?
              customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
           
            end
          end
          end
  
