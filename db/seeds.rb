# frozen_string_literal: true

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


LoadPokemonDb.perform_async if Pokemon.all.empty? # loads pokemon db on first encounter

User.create(name: 'Anton', email: 'anton@mail.tu', password: '123456', role: 1)
User.create(name: 'Yulia', email: 'yulia@mail.tu', password: '123456')
User.create(name: 'Maksim', email: 'maksim@mail.tu', password: '123456')

5.times do
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: Faker::Internet.password(min_length: 6))
end

Article.create(title: 'What are Effort Values?',
               body: "Pokémon battle, in addition to gaining experience points they also obtain Effort Values (usually referred to as EVs), which are special hidden values in each stat (HP, Attack and so on). Each Pokémon you battle against \"gives off\" EVs in one or more stats.\r\n\r\nGenerally, this relates to the Pokémon's strongest stat - for example, if you battle a Geodude your Pokémon will get one EV in the Defense stat. If you fight a Gengar, you will get three Special Attack EVs. (See the pages to the left to see which Pokémon give off which EVs.)\r\n\r\nNewly-hatched eggs and Pokémon caught in the wild - regardless of level - have no EVs and thus act as a \"blank sheet\" for EV training. Any Pokémon that has gained experience points from battling will have gained some EVs.\r\n\r\nEvery 4 EVs obtained in a particular stat equals one more point for that stat, by the time that Pokémon reaches level 100. At low levels you may not see all the points added straight away. If your Pokémon is at a high level you will see a lot of additional points going on to the appropriate stats at each level up.\r\n\r\nBidoof In total a Pokémon can gain 510 EVs, but only 255 in one stat. Since 4 EVs equals one stat point, if you want to max out a particular stat it's only useful to get 252 EVs (63 points). The last 3 EVs would be wasted. However, in practice it's a chore to count exactly how many EVs you have obtained (there's no other way to tell) so you may wish to simply max out a particular stat and forego a point or two.\r\n\r\nWhen you have reached those 510 EVs, you can earn an Effort Ribbon in Diamond/Pearl/Platinum by visiting the woman in the Sunyshore City market. If you have lost count with some stats, this is obviously useful for knowing when to stop EV training!",
               user_id: 1, status: 'public')
Article.create(title: 'Pokémon Gold & Silver',
               body: "Gold & Silver take place in the region of Johto, which it turns out is to the west of Kanto. Starting in New Bark Town, you receive a new Pokémon - Chikorita, Cyndaquil or Totodile - and begin your journey. There are 8 gyms to conquer in Johto (whose types are all different from those in Kanto) followed by the Elite Four.\r\n\r\nOn your journey you encounter a reformed Team Rocket, who are cutting off the tails of Slowpoke. Later you can encounter a shiny Gyarados at the Lake of Rage.\r\n\r\nAfter the game is complete, it's possible to roam around Kanto and tackle the 8 original gyms. Finally, located between Johto and Kanto is Mt. Silver, containing some rare Pokémon and \"Pokémon Trainer Red\" who has some incredibly high level Pokémon. ",
               user_id: 1, status: 'archived')
Article.create(title: 'Pokémon Platinum',
               body: "The majority of Platinum follows the same story as Diamond and Pearl, however, there are some key changes. The beginning is slightly different - you meet Professor Rowan and his assistant before you get to the lake and he lets you choose one of the three starters. You then first battle your rival, rather than a wild Pokémon.\r\n\r\nThe order in which you tackle Sinnoh's gyms changes. In Diamond/Pearl your third gym battle was Maylene in Veilstone City, followed by Crasher Wake in Pastoria City, then Fantina in Hearthome City. In Platinum the third gym you come to is Fantina's then Maylene and Wake.",
               user_id: 2, status: 'public')

5.times do
  Article.create(title: Faker::Lorem.sentence(word_count: rand(2..7)),
                 body: Faker::Lorem.paragraphs(number: rand(4..10)).join(" "),
                 user_id: rand(8) + 1,
                 status: 'public',
                 created_at: rand(0..48).hours.ago
  )
end

25.times do
  Comment.create(body: Faker::Lorem.sentences.join(" "),
                 user_id: rand(8) + 1,
                 status: 'public',
                 article_id: rand(8) + 1,
                 created_at: rand(0..48).hours.ago
  )
end
