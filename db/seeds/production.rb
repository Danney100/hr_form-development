group_label = "PRODUCTION SEEDS"
puts group_label
puts "-" * group_label.length
puts "\n"

seed_models = [
  # NOTE: No production seeds.
]

if seed_models.any?
  seed_models.each do |model_name|
    load File.join(Rails.root, "db", "seeds", "production", "#{model_name}.rb")
  end
else
  puts "No production seeds"
  puts "\n"
end
