describe TrendsndealsParser, vcr: true do
  let(:parser) { TrendsndealsParser.new }
  describe '#retrieve' do
    let(:result) { parser.fetch }
    it { expect(result).to eq '' }
  end
end
