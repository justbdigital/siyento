describe Offer do
  let(:offer) { Offer.create! datasource: 'EHLO'}
  it { expect(offer).to be_present }
  it { expect(offer.datasource).to eq 'EHLO' }

end
