describe CashcashpinoyParser, vcr: true do
  let(:parser) { CashcashpinoyParser.new }

  context '#fetch' do
    let(:result) { parser.fetch }
    it { binding.pry; expect(result).to be_truthy }
  end

  context '#link' do
    let(:hash) { {reference_id: "10610", title: "Stylish Umbrellas", category_id: "6", s_amount: "2745",   category_name: "Home & Decor" } }
    let(:result) { parser.link hash }
    let(:expected) { "http://www.cashcashpinoy.com/#!/6-home-and-decor/10610-stylish-umbrellas" }
    it { expect(result).to eq expected }
  end
end
