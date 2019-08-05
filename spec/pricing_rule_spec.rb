require './lib/pricing_rule.rb'
describe PricingRule do
  context '.initialize' do
    let(:rule) {PricingRule.new }
   
    it "should initialize price" do
      price_object = rule.price

      expect(price_object).to include({"large_pizza"=>394.99, "medium_pizza"=>322.99, "small_pizza"=>269.99})
    end

  end

  describe '.calculate_price' do
    
    context 'for infosys' do
      let(:rule) { PricingRule.new }

      it "should return total price" do
        total = rule.calculate_price('Infosys','small_pizza', 1)

        expect(total).to eq 269.99
      end

      it "should return total price with offer price" do
        total = rule.calculate_price('Infosys','small_pizza', 3)

        expect(total).to eq 539.98
      end
    end


    context 'for Amazon' do
      let(:rule) { PricingRule.new }

      it "should return total price" do
        total = rule.calculate_price('Amazon','small_pizza', 2)

        expect(total).to eq 539.98
      end

      it "should return total price with offer price" do
        total = rule.calculate_price('Amazon','large_pizza', 1)

        expect(total).to eq 299.99
      end

    end

    context 'for default' do
      let(:rule) { PricingRule.new }

      it "should return total price" do
        total = rule.calculate_price('default','small_pizza', 1)

        expect(total).to eq 269.99
      end

      it "should return total price with offer price" do
        total = rule.calculate_price('default','small_pizza', 3)

        expect(total).to eq 809.97
      end
    end


    context 'for facebook' do
      let(:rule) { PricingRule.new }

      it "should return total price" do
        total = rule.calculate_price('Facebook','medium_pizza', 4)

        expect(total).to eq 1291.96
      end

      it "should return total price with offer price" do
        total = rule.calculate_price('Facebook','medium_pizza', 5)

        expect(total).to eq 1291.96
      end

      it "should return total price with offer price" do
        total = rule.calculate_price('Facebook','large_pizza', 2)

        expect(total).to eq 779.98
      end
    end
  end
end
