# frozen_string_literal: true

# potentioal worker
class ViewCounterWorker
  include Sidekiq::Worker

  def perform; end
end
