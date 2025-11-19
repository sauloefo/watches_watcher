class VerifyBrandsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Brand.find_each do |brand|
      brand.update(verified_at: Time.current)
    end
  end
end
