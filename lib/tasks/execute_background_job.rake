namespace :custom_tasks do
  task :execute_background_job => :environment do
    ImportFbiWantedsService.execute
    ImportInterpolWantedsService.execute
  end
end
