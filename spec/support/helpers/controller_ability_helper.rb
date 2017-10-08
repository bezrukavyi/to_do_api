RSpec.configure do |config|
  config.before(type: :controller) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)

    allow(@controller).to receive(:current_ability) { @ability }
    allow(@controller).to receive(:current_user) { user }

    @ability.can :manage, :all
  end
end
