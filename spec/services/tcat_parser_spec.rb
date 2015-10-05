describe TcatParser, vcr: true do
  let(:parser) { TcatParser.new }
  let(:result) { parser.fetch }
  describe '#retrieve', :focus do

    it { expect(result).to eq '' }

  end
end
