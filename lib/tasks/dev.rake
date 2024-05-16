namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      # %x(rails dev:add_book_currents)
      %x(rails dev:add_kinds)
      %x(rails dev:add_authors)
      %x(rails dev:add_publishing_companies)
      %x(rails dev:add_books)
      %x(rails dev:add_users)
      %x(rails dev:add_reviews)

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Cadastrando Usuários"
   task add_users: :environment do
    show_spinner("Cadastrando Usuários") do
      40.times do |i|
        User.create!(
          name: Faker::Name.name,
          nickname: Faker::Internet.username,
          image: "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          email: Faker::Internet.email,
          password: "12345678"
        )
      end
    end
  end

  desc "Cadastrando os Livros"
   task add_users: :environment do
    show_spinner("cadastrando livros") do
      100.times do |i|
        Book.create!(
          cover: "https://marketplace.canva.com/EAE4oJOnMh0/1/0/1003w/canva-capa-de-livro-de-suspense-O7z4yw4a5k8.jpg",
          title: Faker::Book.title,
          description: Faker::Lorem.paragraphs(number: 5).join,
          pages: rand(100..500),
          first_published: Faker::Date.between(from: '1980-01-01', to: '2006-01-01'),
          author_id: Author.pluck(:id).sample,
          publishing_company_id: PublishingCompany.pluck(:id).sample,
          kind_id: Kind.all.sample.id
        )
      end
    end
  end

  desc "Cadastrando Autores"
   task add_authors: :environment do
    show_spinner("cadastrando Autores") do
      30.times do |i|
        Author.create!(
          name: Faker::Book.author,
          picture: "https://static.vecteezy.com/ti/vetor-gratis/p3/11186876-simbolo-de-foto-de-perfil-masculino-vetor.jpg",
          biography: Faker::Lorem.paragraphs(number: 5).join
        )
      end
    end
  end

  desc "Cadastrando Editoras"
   task add_publishing_companies: :environment do
    show_spinner("cadastrando Editoras") do
      25.times do |i|
        PublishingCompany.create!(
          company_name: Faker::Book.publisher
        )
      end
    end
  end

  desc "Cadastrando Gêneros"
   task add_kinds: :environment do
    show_spinner("cadastrando Gêneros") do
      30.times do |i|
        Kind.create!(
          genre: Faker::Book.genre
        )
      end
    end
  end

  desc "Cadastrando Reviews"
   task add_reviews: :environment do
    show_spinner("cadastrando Reviews") do
      300.times do |i|
        Review.create!(
          rating: rand(1..5),
          comment: Faker::Lorem.paragraphs(number: 3).join,
          user_id: User.pluck(:id).sample,
          book_id: Book.pluck(:id).sample
        )
      end
    end
  end

  def show_spinner(msg_start, msg_end = "Concluído!", &block)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end