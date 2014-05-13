#lib/tasks/import.rake
require 'csv'
desc "Import games from CSV file"
task :import, [:filename] => :environment do
  CSV.foreach('db/games.csv', :headers => true) do |row|
    Game.create!(row.to_hash)
  end
end
