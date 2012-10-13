namespace :purge do
  
  desc "Removes data related to anonymous users"
  task :anonymous_users => :environment do
    AnonymousUser.destroy_all
  end
  
end