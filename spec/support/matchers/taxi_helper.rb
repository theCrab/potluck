module TaxiHelper
  DataMapper::Model.raise_on_save_failure = true
end

module SubscriptionSpecHelpers
  def residues(subscriptions)
    subscriptions.map(&:residue)
  end

  def unique_residues(subscriptions)
    subscriptions.map(&:residue).uniq
  end

  def beginning
    Subscription.beginning
  end
end
