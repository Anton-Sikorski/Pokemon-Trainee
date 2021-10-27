# frozen_string_literal: true

# potential worker
class ViewCounterWorker
  include Sidekiq::Worker

  def perform; end
end
