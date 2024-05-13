namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      # %x(rails dev:add_book_currents)
      %x(rails dev:add_authors)
      %x(rails dev:add_publishing_companies)
      %x(rails dev:add_kinds)
      %x(rails dev:add_books)

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Cadastrando os Livros"
   task add_books: :environment do
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

  def show_spinner(msg_start, msg_end = "Concluído!", &block)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end