RSpec.configure do |config|
  config.before(:each, type: :controller) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @ability.can :manage, :all
    allow(@controller).to receive(:current_ability).and_return(@ability)
  end
end
