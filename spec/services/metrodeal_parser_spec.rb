describe MetrodealParser, vcr: true do
  let(:parser) { MetrodealParser.new }
  let(:result) { parser.fetch }

  context '#fetch' do
    it { expect(result).to be_kind_of Array }
  end
end
