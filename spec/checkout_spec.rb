require './lib/pricing_rule.rb'
require './lib/checkout.rb'
describe "Checkout" do
 
  context '.add_item for default' do
    let(:rule) {PricingRule.new }
    let(:co) {Checkout.new('default',rule) }

    it "should add item and calculate total" do
      co.add_item('small pizza')
      co.add_item('medium pizza')
      item = co.add_item('large pizza')

      expect(item["small_pizza"]).to eq 1
      expect(item["medium_pizza"]).to eq 1
      expect(item["large_pizza"]).to eq 1

      total = co.total
      expect(total).to eq 987.97
    end

  end

  context '.add_item for Infosys' do
    let(:rule) {PricingRule.new }
    let(:co) {Checkout.new('Infosys',rule) }

    it "should add item and calculate total" do
      co.add_item('small pizza')
      co.add_item('small pizza')
      co.add_item('small pizza')
      item = co.add_item('large pizza')

      expect(item["small_pizza"]).to eq 3
      expect(item["large_pizza"]).to eq 1

      total = co.total
      expect(total).to eq 934.97
    end
  end

  context '.add_item for Amazon' do
    let(:rule) {PricingRule.new }
    let(:co) {Checkout.new('Amazon',rule) }


    it "should add item and calculate total" do
      co.add_item('medium pizza')
      co.add_item('medium pizza')
      co.add_item('medium pizza')
      item = co.add_item('large pizza')

      expect(item["medium_pizza"]).to eq 3
      expect(item["large_pizza"]).to eq 1

      total = co.total
      expect(total).to eq 1268.96
    end

  end

  context '.add_item for Facebook' do
    let(:rule) {PricingRule.new }
    let(:co) {Checkout.new('Facebook',rule) }


    it "should add item and calculate total" do
      co.add_item('medium pizza')
      co.add_item('medium pizza')
      co.add_item('medium pizza')
      co.add_item('medium pizza')
      co.add_item('medium pizza')
      item = co.add_item('large pizza')

      expect(item["medium_pizza"]).to eq 5
      expect(item["large_pizza"]).to eq 1

      total = co.total
      expect(total).to eq 1681.95
    end

  end
end
