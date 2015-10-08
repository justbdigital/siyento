describe DealgrocerParser, vcr: true do
  describe '#retrieve', :focus do
    let(:parser) { DealgrocerParser.new }
    let(:result) { parser.fetch }
    it { expect(result).to eq '' }
  end
end
