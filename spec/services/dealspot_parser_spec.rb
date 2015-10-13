describe DealspotParser, vcr: true do
  describe '#retrieve' do
    let(:parser) { DealspotParser.new }
    let(:result) { parser.fetch }
    it { expect(result).to eq '' }
  end
end
