# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Seller.destroy_all

Investor.destroy_all

User.destroy_all

invoice_payers = [
  {
    cnpj: "45543915037697",
    name: "CARREFOUR COMERCIO E INDUSTRIA LTDA",
    address: "Avenida Engenheiro George Corbisier",
    address_number: "273",
    phone_number:"1137796891",
    state:"SP",
    zip_code: "04345000",
    neighborhood: "Jabaquara",
    city:"Sao Paulo",
    seller_id: 1
    },
    {
      cnpj: "07740586000170",
      name: "ORTHOMETRIC IND. E COM. DE PROD.MEDICOS E ODONT.",
      address: "RUA IRINEU MARTINS",
      address_number: "280",
      phone_number:"1433112726",
      state:"SP",
      zip_code: "17539059",
      neighborhood: "Jose Ferreira da Costa Jr",
      city:"Marilia",
      seller_id: 1
    },

    {
      cnpj: "01234567891011",
      name: "LE WAGON",
      address: "RUA MOURATO COELHO",
      address_number: "280",
      phone_number:"1433112726",
      state:"SP",
      zip_code: "17539059",
      neighborhood: "Jose Ferreira da Costa Jr",
      city:"São Paulo",
      seller_id: 1
    },

    {
      cnpj: "11109876543210",
      name: "SAMSUNG",
      address: "AV PAULISTA",
      address_number: "100",
      phone_number:"1190112726",
      state:"SP",
      zip_code: "17539059",
      neighborhood: "Bela Vista",
      city:"São Paulo",
      seller_id: 1
    }

  ]

  sellers = [
    {
      cnpj: "48935902000146",
      name: "SCHOELLER DO BRASIL COMERCIO E REPRESENTACOES LTDA",
      address: "Rua Afonso Braz",
      address_number: "579",
      address_complement:"Cj. 86",
      phone_number:"1130442151",
      state:"SP",
      zip_code: "04511011",
      neighborhood: "Vila Nova Conceicao",
      city:"Sao Paulo",
      number_of_employees: 42
    }
  ]

  investors = [
    {
      cnpj: "123456789",
      name: "FACTORING 1 LTDA",
      address: "Rua Mourato Coelho",
      address_number: "123",
      address_complement:"",
      phone_number:"1190202151",
      state:"SP",
      zip_code: "04511011",
      neighborhood: "Vila Madalena",
      city:"Santos"
    }
  ]

  users = [
    {
      email: "user1@email.com",
      password: "123123",
      name: "User 1 Seller",
      cpf: 99999999999,
      phone_number: 11999999999,
      seller_id: 1,
      investor_id: nil,
      is_seller: true
    },

    {
      email: "user2@email.com",
      password: "123123",
      name: "User 2 Investor",
      cpf: 99999999999,
      phone_number: 11999999999,
      seller_id: nil,
      investor_id: 1,
      is_seller: false
    }
  ]

  sellers.each do |seller|
    puts "Criando seller cidade: #{seller[:city]}"
    sel = Seller.new(seller)
    sel.save!
  end

  invoice_payers.each do |invoice|
    puts "Criando invoicepayer cidade: #{invoice[:city]}"
    InvoicePayer.create(invoice)
  end

  investors.each do |investor|
    puts "Criando investor cidade: #{investor[:city]}"
    Investor.create(investor)
  end

  users.each do |user|
    puts "Criando user cidade: #{user[:name]}"
    User.create(user)
  end


