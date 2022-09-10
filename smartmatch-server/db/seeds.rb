# puts "🌱 Seeding spices..."

# Seed your database here

User.destroy_all
Match.destroy_all

male_images = [
    
    "https://images.unsplash.com/photo-1489980478712-2ab535aa775f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1492462543947-040389c4a66c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.pexels.com/photos/8939700/pexels-photo-8939700.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
    "https://images.pexels.com/photos/13469419/pexels-photo-13469419.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
    "https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
    "https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1148&q=80",
    "https://images.unsplash.com/photo-1522556189639-b150ed9c4330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1558374805-cc55cedfb7f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1629967963568-f98f755d47af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
]
female_images = [
    "https://images.pexels.com/photos/12050692/pexels-photo-12050692.jpeg",
    "https://images.pexels.com/photos/11977689/pexels-photo-11977689.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1485217988980-11786ced9454?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1520466809213-7b9a56adcd45?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1520333789090-1afc82db536a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
    "https://images.unsplash.com/photo-1482849297070-f4fae2173efe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1492814580460-1f9a2a463cfe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.unsplash.com/photo-1507101105822-7472b28e22ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80",
    "https://images.unsplash.com/photo-1612000529646-f424a2aa1bff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
]

puts "Creating users..."
150.times do
    User.create(username: Faker::Artist.name, password: Faker::Artist.name, gender: "Male", name: Faker::Name.male_first_name, bio: Faker::Quote.matz, hobby: Faker::Hobby.activity, preference: Faker::Gender.binary_type, age: rand(19..40), picture: male_images.sample, location: Faker::Address.state)
    User.create(username: Faker::Artist.name, password: Faker::Artist.name, gender: "Female", name: Faker::Name.female_first_name, bio: Faker::Quote.matz, hobby: Faker::Hobby.activity, preference: Faker::Gender.binary_type, age: rand(19..40), picture: female_images.sample, location: Faker::Address.state)

end

User.create(username: "Evan", password: "snickers", gender: "Male", name: "Evan", bio: "Hello World", hobby: "Skiing", preference: "Female", age: 26, picture: "https://evanchernicky.com/wp-content/uploads/2021/06/evan-logo-transparent.png", location: "DC")


puts "Creating matches..."
500.times do
    Match.create(liked_id: User.ids.sample, liker_id: User.ids.sample)
end

puts "Done seeding!"
