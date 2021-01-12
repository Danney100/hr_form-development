puts "\n"
puts "Processing seeds.rb:"
puts "\n"
puts DateTime.current
puts "Environment: #{Rails.env}"
puts "\n"

case Rails.env
when "development"
  load Rails.root.join("db", "seeds", "production.rb")
  load Rails.root.join("db", "seeds", "development.rb")
when "production"
  load Rails.root.join("db", "seeds", "production.rb")
end
