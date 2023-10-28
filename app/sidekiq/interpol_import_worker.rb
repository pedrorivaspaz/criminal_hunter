class InterpolImportWorker
  include Sidekiq::Job

  queue_as :high

  sidekiq_options backtrace: true

  def perform
    ImportFbiWantedsService.execute
  end
end