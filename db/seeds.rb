# coding: utf-8

puts 'Seeding the database...'

[
  { pt: 'Arte', en: 'Art' },
  { pt: 'Artes plásticas', en: 'Visual Arts' },
  { pt: 'Circo', en: 'Circus' },
  { pt: 'Comunidade', en: 'Community' },
  { pt: 'Humor', en: 'Humor' },
  { pt: 'Quadrinhos', en: 'Comicbooks' },
  { pt: 'Dança', en: 'Dance' },
  { pt: 'Design', en: 'Design' },
  { pt: 'Eventos', en: 'Events' },
  { pt: 'Moda', en: 'Fashion' },
  { pt: 'Gastronomia', en: 'Gastronomy' },
  { pt: 'Cinema e Vídeo', en: 'Film & Video' },
  { pt: 'Jogos', en: 'Games' },
  { pt: 'Jornalismo', en: 'Journalism' },
  { pt: 'Música', en: 'Music' },
  { pt: 'Fotografia', en: 'Photography' },
  { pt: 'Ciência e Tecnologia', en: 'Science & Technology' },
  { pt: 'Teatro', en: 'Theatre' },
  { pt: 'Esporte', en: 'Sport' },
  { pt: 'Web', en: 'Web' },
  { pt: 'Carnaval', en: 'Carnival' },
  { pt: 'Arquitetura e Urbanismo', en: 'Architecture & Urbanism' },
  { pt: 'Literatura', en: 'Literature' },
  { pt: 'Mobilidade e Transporte', en: 'Mobility & Transportation' },
  { pt: 'Meio Ambiente', en: 'Environment' },
  { pt: 'Negócios Sociais', en: 'Social Business' },
  { pt: 'Educação', en: 'Education' },
  { pt: 'Filmes de Ficção', en: 'Fiction Films' },
  { pt: 'Filmes Documentários', en: 'Documentary Films' },
  { pt: 'Filmes Universitários', en: 'Experimental Films' }
].each do |name|
   category = Category.find_or_initialize_by(name_pt: name[:pt])
   category.update_attributes({
     name_en: name[:en]
   })
 end

Channel.find_or_create_by!(name: "Channel name") do |c|
  c.permalink = "sample-permalink"
  c.description = "Lorem Ipsum"
end


OauthProvider.find_or_create_by!(name: 'facebook') do |o|
  o.key = '372620349480665'
  o.secret = '50c0935b62637580aaf098c8f5478969'
  o.path = 'facebook'
end


puts
puts '============================================='
puts ' Showing all Authentication Providers'
puts '---------------------------------------------'

OauthProvider.all.each do |conf|
  a = conf.attributes
  puts "  name #{a['name']}"
  puts "     key: #{a['key']}"
  puts "     secret: #{a['secret']}"
  puts "     path: #{a['path']}"
  puts
end


puts
puts '============================================='
puts ' Showing all entries in Configuration Table...'
puts '---------------------------------------------'

puts '---------------------------------------------'
puts 'Done!'


## Optional Seed file
## to be used during development

puts "Adding Admin user..."

  User.find_or_create_by!(name: "Admin") do |u|
    u.nickname = "Admin"
    u.email = "admin@admin.com"
    u.password = "password"
    u.password_confirmation = "password"
    u.remember_me = false
    u.admin = true
  end

puts "Adding Funder user..."

  User.find_or_create_by!(name: "Funder") do |u|
    u.nickname = "Funder"
    u.email = "funder@funder.com"
    u.nickname = "Funder"
    u.password = "password"
    u.password_confirmation = "password"
    u.remember_me = false
  end

puts "Adding Test user..."

  User.find_or_create_by!(name: "Test") do |u|
    u.nickname = "Test"
    u.email = "test@test.com"
    u.nickname = "Test"
    u.password = "password"
    u.password_confirmation = "password"
    u.remember_me = false
  end

puts "Done!"
