class WantedsImportWorker
  include Sidekiq::Job
  
  queue_as :high

  sidekiq_options backtrace: true

  def perform
    ImportInterpolWantedsService.execute
  end
end