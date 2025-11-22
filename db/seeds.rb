# Create admin user
admin = User.find_or_create_by!(email_address: "admin@example.com") do |user|
  user.name = "Admin User"
  user.password = "password123"
  user.role = :administrator
  user.bio = "System Administrator"
end
puts "✓ Created admin user: #{admin.email_address}"

# Create regular test users
users_data = [
  { name: "Alice Johnson", bio: "Product Manager" },
  { name: "Bob Smith", bio: "Senior Developer" },
  { name: "Charlie Brown", bio: "Designer" },
  { name: "Diana Prince", bio: "UX Researcher" },
  { name: "Eve Williams", bio: "Backend Engineer" },
  { name: "Frank Castle", bio: "DevOps Engineer" },
  { name: "Grace Hopper", bio: "Software Architect" },
  { name: "Henry Ford", bio: "Frontend Developer" },
  { name: "Iris West", bio: "QA Engineer" },
  { name: "Jack Ryan", bio: "Security Specialist" },
  { name: "Kate Bishop", bio: "Mobile Developer" },
  { name: "Leo Martinez", bio: "Data Analyst" },
  { name: "Maya Anderson", bio: "Technical Writer" },
  { name: "Nathan Drake", bio: "Full Stack Developer" },
  { name: "Olivia Pope", bio: "Project Manager" }
]

users_data.each_with_index do |data, index|
  email = "#{data[:name].downcase.gsub(' ', '.')}@example.com"
  user = User.find_or_create_by!(email_address: email) do |u|
    u.name = data[:name]
    u.password = "password123"
    u.bio = data[:bio]
  end
  puts "✓ Created user: #{user.name} (#{user.email_address})"
end

# Create a bot user
bot = User.find_or_create_by!(email_address: "bot@example.com") do |user|
  user.name = "Helper Bot"
  user.role = :bot
  user.bot_token = User.generate_bot_token
end
puts "✓ Created bot user: #{bot.name}"

puts "\n#{User.count} total users in database"
puts "\nLogin credentials for all users:"
puts "Email: any of the above emails"
puts "Password: password123"
