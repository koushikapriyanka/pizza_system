class Checkout
  def initialize(company,pricing_rule)
    @company = company
    @rule = pricing_rule
    @item = {"small_pizza"=> 0, "medium_pizza"=> 0, "large_pizza"=> 0}
  end

  def add_item(item)
    @item[item.gsub(' ','_')] += 1
    @item
  end

  def total
    @item.sum do |pizza_size, qty|
      @rule.calculate_price(@company,pizza_size, qty)
    end
  end
end
