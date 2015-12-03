describe EnsogoParser, vcr: true do
  describe '#retrieve' do
    let(:parser) { EnsogoParser.new }
    let(:result) { parser.fetch }
    it do
      expect(result).to be_kind_of Array
    end
  end
end
