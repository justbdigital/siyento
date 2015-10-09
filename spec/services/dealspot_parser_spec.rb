describe DealspotParser, vcr: true do
  describe '#retrieve', :focus do
    let(:parser) { DealspotParser.new }
    let(:result) { parser.fetch }
    it { expect(result).to eq '' }
  end
end
