require "sidekiq-ent"

Sidekiq::Enterprise::Crypto.enable(active_version: 1) do |_version|
  "This is a very very secret key..."
end

class PrivateWorker
  include Sidekiq::Worker
  sidekiq_options encrypt: true

  def perform(x, y, secret_bag)
    puts "*** secret bag: #{secret_bag}"
    raise "Error"
  end
end

PrivateWorker.perform_async(1, 2, {"ssn" => "123-45-6789"})
