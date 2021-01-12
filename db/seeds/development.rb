group_label = "DEVELOPMENT SEEDS"
puts group_label
puts "-" * group_label.length
puts "\n"

seed_models = [
  "books"
]

if seed_models.any?
  seed_models.each do |model_name|
    load File.join(Rails.root, "db", "seeds", "development", "#{model_name}.rb")
  end
else
  puts "No development seeds"
  puts "\n"
end
