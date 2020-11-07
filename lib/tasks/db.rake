namespace :db do
  desc 'Drop, create, migrate then seed the database'
  task reseed: ['db:drop', 'db:create', 'db:migrate', 'db:seed'] do
    puts 'Reseeding completed'
  end
end
