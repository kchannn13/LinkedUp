require "open-uri"
# require 'httparty'
# require 'dotenv/load'

# ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Experience.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('experiences')
  
    puts "Creating users..."
    puts "Creating experiences..."
    # Create one user with an easy to remember username, email, and password:
    # def fetch_company_logo(company)
    #   response = HTTParty.get("https://company.clearbit.com/v1/domains/find?name=#{company}",
    #     headers: { Authorization: "Bearer #{ENV['CLEARBIT_API_KEY']}" })
  
    #   data = JSON.parse(response.body)
    #   @logo = data["logo"]
    # end
    
    user1 = User.create!(
      phone_number: '+123456789', 
      email: 'demo@user.io', 
      first_name: 'Demo',
      last_name: 'User',
      headline: 'full stack developer looking for opportunity',
      password: 'password',
      location: 'New York, New York, United States',
      about: "As a passionate full stack developer, I have extensive knowledge of React, Redux, JavaScript, CSS, HTML, Ruby, and Canvas, 
      gained through online courses and personal projects.I'm eager to join a team where I can contribute my skills and continue to learn from experienced developers."
    )

    user2 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'Squidward@user.io', 
      first_name: 'Squidward',
      last_name: 'Tentacles',
      headline: 'Creative Problem Solver | Team Player',
      password: 'password',
      location: '122 Conch Street',
      about: "Experienced musician with a passion for the arts, seeking opportunities to showcase my skills and grow as an artist. 
      Able to work independently or as part of a team, with a strong focus on quality and attention to detail."
    )

    user3 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'yor@user.io', 
      first_name: 'Yor',
      last_name: 'Forger',
      headline: 'Ordinary Clerk at Berlint City Hall',
      password: 'password',
      location: 'Ostania',
      about: "I don't need to be at peace. I don't care if I have to bloody my hands. Even if it means living a life that could end at any moment... 
      Even if it means having to leave the Forger family... I think Loid would respect that. He would understand. That's why I won't give up this fight!"
    )

    user4 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'loid@user.io', 
      first_name: 'Loid',
      last_name: 'Forger',
      headline: 'Spy',
      password: 'password',
      location: 'Ostania',
      about: "Not fit to be a spy? No. The mistake was endangering that child in the first place. How did I not see that? Making a world where kids don't need to cry... 
      That was the whole reason... I became a spy in the first place."
    )

    user5 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'ted@user.io', 
      first_name: 'Ted',
      last_name: 'Mosby',
      headline: 'Innovative Architect | Building Better Communities',
      password: 'password',
      location: 'New York, New York, United States',
      about: "Passionate and skilled architect with expertise in sustainable design and project management. Dedicated to creating spaces that inspire and improve the lives of individuals and communities."
    )

    user6 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'gary@user.io', 
      first_name: 'Gary',
      last_name: 'The Snail',
      headline: 'Meow',
      password: 'password',
      location: 'pineapple house',
      about: "Meow"
    )

    user7 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'harry@user.io', 
      first_name: 'Harry',
      last_name: 'Potter',
      headline: 'Magical Wizard with a Passion for Adventure',
      password: 'password',
      location: 'United Kingdom',
      about: "a skilled wizard with a thirst for adventure and a deep commitment to protecting the magical world. My experience battling dark forces 
      has honed my skills in problem-solving, leadership, and teamwork. I'm seeking opportunities to use my talents to make a positive impact and 
      continue my journey of growth and discovery."
    )

    user8 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'naruto@userio', 
      first_name: 'Naruto',
      last_name: 'Uzumaki',
      headline: 'Driven to Become Hokage',
      password: 'password',
      location: 'Konohagakure (Hidden Leaf Village)',
      about: "Determined ninja with an unbreakable will to become Hokage. A master of ninjutsu, taijutsu, and genjutsu, I am always eager to learn and grow as a ninja. 
      Let's train together and become stronger!"
    )

    user9 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'gon@user.io', 
      first_name: 'Gon',
      last_name: 'Freecss',
      headline: "Young Hunter Seeking Father's Trail",
      password: 'password',
      location: 'Hunter',
      about: "Gon is a determined young hunter on a mission to find his father and uncover the secrets of the Hunter Association. 
      With his natural talent and adventurous spirit, he faces challenges head-on and makes new friends along the way."
    )

    user10 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'tony@user.io', 
      first_name: 'Tony',
      last_name: 'Stark',
      headline: "Genius Inventor and Avenger",
      password: 'password',
      location: 'Manhattan, New York, United States',
      about: "Tony Stark, aka Iron Man, is a brilliant inventor and billionaire playboy who fights for justice as a member of the Avengers. 
      He uses his high-tech suit to take on threats to humanity, while navigating his own personal demons."
    )

    user11 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'spongebob@user.io', 
      first_name: 'Spongebob',
      last_name: 'SquarePants',
      headline: "Optimistic Sea Sponge",
      password: 'password',
      location: 'pineapple house',
      about: "SpongeBob SquarePants is an enthusiastic and optimistic sea sponge who loves his job as a fry cook at the Krusty Krab. 
      With his best friend Patrick by his side, he embarks on wacky adventures in the underwater city of Bikini Bottom."
    )

    user12 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'peter@user.io', 
      first_name: 'Peter',
      last_name: 'Parker',
      headline: "Amazing Spider-Man",
      password: 'password',
      location: 'Manhattan, New York, United States',
      about: "Peter Parker is a high school student with extraordinary spider-like abilities, fighting crime as the one and only Spider-Man. 
      He balances his superhero life with school and personal relationships, always striving to do what's right."
    )

    user13 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'anya@user.io', 
      first_name: 'Anya',
      last_name: 'Forger',
      headline: "Peanuts",
      password: 'password',
      location: 'Ostania',
      about: "hates carrots"
    )

    user14 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'gojo@user.io', 
      first_name: 'Gojo',
      last_name: 'Satoru',
      headline: "Jujutsu Sorcerer Extraordinaire",
      password: 'password',
      location: 'Tokyo',
      about: "Muryōkūsho"
    )

    user15 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'hermione@user.io', 
      first_name: 'Hermione',
      last_name: 'Granger',
      headline: "Analytical Thinker | Driving Impactful Change",
      password: 'password',
      location: 'England',
      about: "Experienced and detail-oriented professional with a passion for problem-solving and strategic thinking. 
      Skilled in research, analysis, and project management, with a strong focus on driving meaningful and positive change."
    )

    user16 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: 'daenerys@user.io', 
      first_name: 'Daenerys',
      last_name: 'Targaryen',
      headline: "Mother of Dragons",
      password: 'password',
      location: 'The island of Lokrum',
      about: "Daenerys Stormborn of House Targaryen, the First of Her Name, 
      Queen of the Andals and the First Men, Protector of the Seven Kingdoms, 
      the Mother of Dragons, the Khaleesi of the Great Grass Sea, the Unburnt, the Breaker of Chains."
    )

    user17 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: Faker::Internet.unique.email, 
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      headline: "Data Analyst | Transforming Insights into Action",
      password: 'password',
      location: Faker::Address.country,
      about: "Detail-oriented data analyst with a passion for using insights to drive business decisions and growth."
    )

    user18 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: Faker::Internet.unique.email, 
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      headline: "Creative Designer | Bringing Ideas to Life",
      password: 'password',
      location: Faker::Address.country,
      about: "Experienced creative designer skilled in turning ideas into stunning visual assets that captivate and engage audiences"
    )

    user19 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: Faker::Internet.unique.email, 
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      headline: "Strategic Thinker | Driving Business Growth",
      password: 'password',
      location: Faker::Address.country,
      about: "Visionary leader with expertise in strategy, innovation, and business development. 
      Passionate about leveraging cutting-edge technologies to drive business growth and success."
    )

    user20 = User.create!(
      phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164, 
      email: Faker::Internet.unique.email, 
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      headline: "Creative Designer | Bringing Ideas to Life",
      password: 'password',
      location: Faker::Address.country,
      about: "Experienced creative designer skilled in turning ideas into 
      stunning visual assets that captivate and engage audiences."
    )

    months = ["January", "February", "March", "April", "May", "June", 
    "July", "August", "September", "October", "November", "December"]

    Experience.create!({
      title: Faker::Job.unique.title,
      company: 'Google',
      description: "- Collaborated with team members to develop and execute effective marketing campaigns.\n" \
      "- Conducted research and analysis to identify customer needs and preferences.\n" \
      "- Implemented new procedures to improve efficiency and productivity.",
      start_month: months[rand(months.length)],
      start_year: 2019,
      user_id: 1,
      end_month: months[rand(months.length)],
      end_year: 2022,
      location: Faker::Address.unique.country,
      # logo: fetch_company_logo('google')
      logo: Faker::Company.logo
    })

    Experience.create!({
      title: Faker::Job.unique.title,
      company: 'Twitter',
      description: "- Managed a portfolio of clients and maintained strong relationships with key stakeholders.\n" \
      "- Utilized various software tools to analyze and interpret data and provide insights for decision-making.\n" \
      "- Developed and delivered presentations to internal and external audiences.",
      start_month: months[rand(months.length)],
      start_year: 2015,
      user_id: 1,
      location: Faker::Address.unique.country,
      end_month: months[rand(months.length)],
      end_year: 2018,
      # logo: fetch_company_logo('twitter')
      logo: Faker::Company.logo
    })

    Experience.create!({
      title: Faker::Job.unique.title,
      company: 'FaceBook',
      description: "- Managed a portfolio of clients and maintained strong relationships with key stakeholders.\n" \
      "- Utilized various software tools to analyze and interpret data and provide insights for decision-making.\n" \
      "- Developed and delivered presentations to internal and external audiences.",
      start_month: months[rand(months.length)],
      start_year: 2010,
      user_id: 1,
      location: Faker::Address.unique.country,
      end_month: months[rand(months.length)],
      end_year: 2014,
      # logo: fetch_company_logo('facebook')
      logo: Faker::Company.logo
    })

    Experience.create!({
      title: Faker::Job.unique.title,
      company: 'Adobe',
      description: "- Managed a portfolio of clients and maintained strong relationships with key stakeholders.\n" \
      "- Utilized various software tools to analyze and interpret data and provide insights for decision-making.\n" \
      "- Developed and delivered presentations to internal and external audiences.",
      start_month: months[rand(months.length)],
      start_year: 2005,
      user_id: 1,
      location: Faker::Address.unique.country,
      end_month: months[rand(months.length)],
      end_year: 2009,
      # logo: fetch_company_logo('adobe')
      logo: Faker::Company.logo
    })
  
    # More users
    # phone_numbers = []
    # 20.times do 
    #     # phone_number = Faker::PhoneNumber.cell_phone_in_e164
    #     # while phone_numbers.include?(phone_number)
    #     #     phone_number = Faker::PhoneNumber.cell_phone_in_e164
    #     # end
    #     # phone_numbers << phone_number
    
    #     # puts "Generated phone number: #{phone_number}"
    
    #     User.create!({
    #         phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164,
    #         email: Faker::Internet.unique.email,
    #         first_name: Faker::Name.first_name,
    #         last_name: Faker::Name.last_name,
    #         headline: 'student @ app academy',
    #         about: Faker::Quote.matz,
    #         location: Faker::Address.country,
    #         password: 'password'
    #     }) 
    # end

    # months = ["January", "February", "March", "April", "May", "June", 
    #       "July", "August", "September", "October", "November", "December"]

    education_start_year = rand(1980..2018)
    education_end_year = education_start_year + 4

    Education.create!({
      school: Faker::Educator.unique.university,
      degree: Faker::Educator.degree,
      user_id: 1,
      start_month: months[rand(months.length)],
      start_year: education_start_year,
      end_month: months[rand(months.length)],
      end_year: education_end_year
    })



    i = 2
    while i < 21 do
      5.times do 
        start_year = rand(2000..2017)
        end_year = rand(start_year+2..2022)

        Experience.create!({
          title: Faker::Job.unique.title,
          company: Faker::Company.unique.name,
          description: Faker::Company.unique.bs,
          start_month: months[rand(months.length)],
          start_year: start_year,
          user_id: i,
          location: Faker::Address.unique.country,
          end_month: months[rand(months.length)],
          end_year: end_year,
          logo: Faker::Company.logo
        })
      end

      education_start_year = rand(1980..2018)
      education_end_year = education_start_year + 4

      Education.create!({
        school: Faker::Educator.unique.university,
        degree: Faker::Educator.degree,
        user_id: i,
        start_month: months[rand(months.length)],
        start_year: education_start_year,
        end_month: months[rand(months.length)],
        end_year: education_end_year
      })
      i += 1
    end

    post1 = Post.create!({
      body: 'first post',
      author_id: 1
    })

    post2 = Post.create!({
      body: 'mood',
      author_id: 2
    })

    # post2.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/Squidward.jpeg"),
    # filename: "Squidward.jpeg"
    # )

    post2.photo.attach( io: File.open(Rails.root.join("db", "assets", "Squidward.jpeg")),
    filename: "Squidward.jpeg"
    )

    post3 = Post.create!({
      body: "this course is good!",
      author_id: 3
    })

    # post3.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/aa+101.png"),
    # filename: "aa101.jpg"
    # )

    post3.photo.attach( io: File.open(Rails.root.join("db", "assets", "aa+101.png")),
    filename: "aa101.jpg"
    )

    post4 = Post.create!({
      body: "too true",
      author_id: 4
    })

    # post4.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/timeBlockinHR.jpg"),
    # filename: "HR.jpg"
    # )

    post4.photo.attach( io: File.open(Rails.root.join("db", "assets", "timeBlockinHR.jpg")),
    filename: "HR.jpg"
    )

    post5 = Post.create!({
      body: "Just found a game that's good!",
      author_id: 10
    })

    # post5.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/gary.png"),
    # filename: "gary.jpg"
    # )

    post5.photo.attach( io: File.open(Rails.root.join("db", "assets", "gary.png")),
    filename: "gary.jpg"
    )

    post6 = Post.create!({
      body: "The course is really good!",
      author_id: 6
    })

    # post6.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/aaCampus.png"),
    # filename: "aaCampus.jpg"
    # )

    post6.photo.attach( io: File.open(Rails.root.join("db", "assets", "aaCampus.png")),
    filename: "aaCampus.jpg"
    )

    post7 = Post.create!({
      body: "A big thank you to @Demo User for giving me the opportunity to take on these new responsibilities at XYZ Company",
      author_id: 7
    })

    post8 = Post.create!({
      body: "I am happy to share that I am starting a new position as Senior Associate, Private Equity!",
      author_id: 8
    })

    post9 = Post.create!({
      body: "recursion?",
      author_id: 9
    })

    # post9.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/recursion.png"),
    # filename: "recursion.jpg"
    # )

    post9.photo.attach( io: File.open(Rails.root.join("db", "assets", "recursion.png")),
    filename: "recursion.jpg"
    )

    post10 = Post.create!({
      body: "Me right now",
      author_id: 1
    })

    # post10.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/codeDoes.JPG"),
    # filename: "codedoes.jpg"
    # )

    post10.photo.attach( io: File.open(Rails.root.join("db", "assets", "codeDoes.jpeg")),
    filename: "codedoes.jpg"
    )

    post11 = Post.create!({
      body: "Need to be always questioning",
      author_id: 5
    })

    # post11.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/itWorks.webp"),
    # filename: "question.jpg"
    # )

    post11.photo.attach( io: File.open(Rails.root.join("db", "assets", "itWorks.webp")),
    filename: "question.jpg"
    )

    post12 = Post.create!({
      body: "So true",
      author_id: 1
    })

    # post12.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/fullStack.jpeg"),
    # filename: "fullStack.jpg"
    # )

    post12.photo.attach( io: File.open(Rails.root.join("db", "assets", "fullStack.jpeg")),
    filename: "fullStack.jpg"
    )

    # user2.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/Squidward.png"),
    # filename: "Squidward.png"
    # )

    user2.photo.attach( io: File.open(Rails.root.join("db", "assets", "Squidward.png")),
    filename: "Squidward.png"
    )

    # user3.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/Yor.webp"),
    # filename: "Yor.jpg"
    # )

    user3.photo.attach( io: File.open(Rails.root.join("db", "assets", "Yor.webp")),
    filename: "Yor.jpg"
    )

    # user4.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/loid.webp"),
    # filename: "Loid.jpg"
    # )

    user4.photo.attach( io: File.open(Rails.root.join("db", "assets", "loid.webp")),
    filename: "Loid.jpg"
    )

    # user5.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/Ted.jpeg"),
    # filename: "Ted.jpg"
    # )

    user5.photo.attach( io: File.open(Rails.root.join("db", "assets", "Ted.jpeg")),
    filename: "Ted.jpg"
    )

    # user6.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/garyicon.png"),
    # filename: "garyIcon.jpg"
    # )

    user6.photo.attach( io: File.open(Rails.root.join("db", "assets", "garyicon.png")),
    filename: "garyIcon.jpg"
    )

    # user7.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/harry.webp"),
    # filename: "harry.jpg"
    # )

    user7.photo.attach( io: File.open(Rails.root.join("db", "assets", "harry.webp")),
    filename: "harry.jpg"
    )

    # user8.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/Naruto.webp"),
    # filename: "naruto.jpg"
    # )

    user8.photo.attach( io: File.open(Rails.root.join("db", "assets", "Naruto.webp")),
    filename: "naruto.jpg"
    )

    # user9.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/gon.jpeg"),
    # filename: "gon.jpg"
    # )

    user9.photo.attach( io: File.open(Rails.root.join("db", "assets", "gon.jpeg")),
    filename: "gon.jpg"
    )

    # user10.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/tony.jpg"),
    # filename: "tony.jpg"
    # )

    user10.photo.attach( io: File.open(Rails.root.join("db", "assets", "tony.jpg")),
    filename: "tony.jpg"
    )

    # user11.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/spongebob.jpeg"),
    # filename: "spongebob.jpg"
    # )

    user11.photo.attach( io: File.open(Rails.root.join("db", "assets", "spongebob.jpeg")),
    filename: "spongebob.jpg"
    )

    # user12.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/peter.webp"),
    # filename: "peter.jpg"
    # )

    user12.photo.attach( io: File.open(Rails.root.join("db", "assets", "peter.webp")),
    filename: "peter.jpg"
    )

    # user13.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/anya.jpeg"),
    # filename: "anya.jpg"
    # )

    user13.photo.attach( io: File.open(Rails.root.join("db", "assets", "anya.jpeg")),
    filename: "anya.jpg"
    )

    # user14.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/gojo.jpeg"),
    # filename: "gojo.jpg"
    # )

    user14.photo.attach( io: File.open(Rails.root.join("db", "assets", "gojo.jpeg")),
    filename: "gojo.jpg"
    )

    # user15.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/Hermione.webp"),
    # filename: "Hermione.jpg"
    # )

    user15.photo.attach( io: File.open(Rails.root.join("db", "assets", "Hermione.webp")),
    filename: "Hermione.jpg"
    )

    # user16.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/Daenerys.webp"),
    # filename: "Daenerys.jpg"
    # )

    user16.photo.attach( io: File.open(Rails.root.join("db", "assets", "Daenerys.webp")),
    filename: "Daenerys.jpg"
    )

    # Post.first.photo.attach( io: URI.open("https://linkedup-seeds.s3.amazonaws.com/cat.jpg"),
    # filename: "cat.jpg"
    # )
  
    puts "Done!"
  # end