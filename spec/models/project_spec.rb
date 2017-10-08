describe Project, type: :model do
  subject { build :project }

  context 'association' do
    it { should have_many :tasks }
    it { should belong_to :user }
  end

  context 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(50) }
  end
end
