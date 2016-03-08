desc "this task removes entrys older than 7 days and is called by the Heroku scheduler add-on"

task :remove_old => :environment do
  @entrypoints = Entrypoint.where('created_at < ?', 7.days.ago)
  @entrypoints.each do |entrypoint|
    entrypoint.destroy
  end
end
  