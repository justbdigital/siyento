describe DealgrocerParser, vcr: true do
  describe '#retrieve' do
    let(:parser) { DealgrocerParser.new }
    let(:result) { parser.fetch }
    it { expect(result).to eq '' }
  end
end
