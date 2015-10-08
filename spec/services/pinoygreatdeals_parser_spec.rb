describe PinoygreatdealsParser, vcr: true do
  describe '#retrieve', :focus do
    let(:parser) { PinoygreatdealsParser.new }
    let(:result) { parser.fetch }
    it { expect(result).to eq '' }
  end
end
