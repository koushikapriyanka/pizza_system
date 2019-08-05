class PricingRule
  attr_accessor :company, :price
  def initialize
    @price = {"small_pizza"=> 269.99, "medium_pizza"=> 322.99, "large_pizza"=> 394.99}
  end

  def calculate_price(company, pizza_size, qty)
    offers = offer_type[company.to_sym]
    if offers && offers[pizza_size.to_sym]
      if offers[pizza_size.to_sym]['x-for-y']
        qty/offers[pizza_size.to_sym]['x-for-y'][:x] * offers[pizza_size.to_sym]['x-for-y'][:offer_price] + (qty % offers[pizza_size.to_sym]['x-for-y'][:x]) * @price[pizza_size]
      else
        offers[pizza_size.to_sym]['discount_price'] * qty
      end
    else
      @price[pizza_size] * qty
    end
  end

  private
  
  def offer_type
    {
      "Infosys": {
        "small_pizza": {
          "x-for-y" => {
            x: 3, y: 2, offer_price: 539.98
          }
        }
      },
      "Facebook": {
        "medium_pizza": {
          "x-for-y" => {
            x: 5, y: 4, offer_price: 1291.96 
          }
        },
        "large_pizza": {
          "discount_price" => 389.99
        }
      },
      "Amazon": {
        "large_pizza": {
          "discount_price" => 299.99
        }
      }
    }
  end
end
