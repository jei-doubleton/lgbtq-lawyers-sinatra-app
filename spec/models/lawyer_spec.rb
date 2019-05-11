require 'pry'
describe 'Lawyer' do
  before do
    @lawyer = Lawyer.create(:name => "Abraham Lincoln")
  end

  it 'can normalize phone_number with no hyphens' do
    @lawyer.phone_number = "123456789"
    expect(@user.normalize_phone).to eq("123-456-789")
  end

  it 'can normalize phone_number with no hyphens' do
    @lawyer.phone_number = "123456789"
    expect(@user.normalize_phone).to eq("123-456-789")
  end

end
