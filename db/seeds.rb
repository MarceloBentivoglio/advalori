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

Expense.destroy_all

invoice_payers = [
  {
    cnpj: "45543915037697",
    name: "Carrefour Ltda",
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
    cnpj: "87426038000109",
    name: "Richard Eli Refrigerantes LTDA",
    address: "Avenida Engenheiro George Corbisier",
    address_number: "273",
    phone_number:"1137796891",
    state:"SP",
    zip_code: "04345000",
    neighborhood: "Jabaquara",
    city:"Sao Paulo",
    seller_id: 3
    },

    {
    cnpj: "83998035000199",
    name: "Alfons Joaquim Mercado LTDA.",
    address: "Avenida Engenheiro George Corbisier",
    address_number: "273",
    phone_number:"1137796891",
    state:"SP",
    zip_code: "04345000",
    neighborhood: "Jabaquara",
    city:"Sao Paulo",
    seller_id: 4
    },

    {
      cnpj: "07740586000170",
      name: "ORTHOMETRIC PROD MEDICOS",
      address: "Rua Irineu Martins",
      address_number: "280",
      phone_number:"1433112726",
      state:"SP",
      zip_code: "17539059",
      neighborhood: "Jose Ferreira da Costa Jr",
      city:"Marilia",
      seller_id: 4
    },

    {
      cnpj: "11109876543210",
      name: "Samsung",
      address: "Av Paulista",
      address_number: "100",
      phone_number:"1190112726",
      state:"SP",
      zip_code: "17539059",
      neighborhood: "Bela Vista",
      city:"São Paulo",
      seller_id: 1
    },

    {
      cnpj: "11109876543210",
      name: "Samsung",
      address: "Av Paulista",
      address_number: "100",
      phone_number:"1190112726",
      state:"SP",
      zip_code: "17539059",
      neighborhood: "Bela Vista",
      city:"São Paulo",
      seller_id: 2
    },

    {
      cnpj: "11109876543210",
      name: "Samsung",
      address: "Av Paulista",
      address_number: "100",
      phone_number:"1190112726",
      state:"SP",
      zip_code: "17539059",
      neighborhood: "Bela Vista",
      city:"São Paulo",
      seller_id: 3
    }

  ]

  sellers = [
    {
      cnpj: "60622358000188",
      name: "Le Wagon Bootcamp",
      address: "Rua Afonso Braz",
      address_number: "579",
      address_complement:"Cj 86",
      phone_number:"1130442151",
      state:"SP",
      zip_code: "04511011",
      neighborhood: "Vila Madalena",
      city:"Sao Paulo",
      number_of_employees: 42
    },
    {
      cnpj: "16375442000152",
      name: "Apple Awesome Computers",
      address: "Rua Afonso Braz",
      address_number: "579",
      address_complement:"Cj 86",
      phone_number:"1130442151",
      state:"SP",
      zip_code: "04511011",
      neighborhood: "Itaim",
      city:"Sao Paulo",
      number_of_employees: 42
    },


    {
      cnpj: "71676236000190",
      name: "Coca Cola Company",
      address: "Rua Afonso Braz",
      address_number: "579",
      address_complement:"Cj 86",
      phone_number:"1130442151",
      state:"SP",
      zip_code: "04511011",
      neighborhood: "Vila Olimpia",
      city:"Sao Paulo",
      number_of_employees: 42
    },

    {
      cnpj: "56568759000120",
      name: "Google Company Inc",
      address: "Rua Afonso Braz",
      address_number: "579",
      address_complement:"Cj 86",
      phone_number:"1130442151",
      state:"SP",
      zip_code: "04511011",
      neighborhood: "Itaim",
      city:"Sao Paulo",
      number_of_employees: 42
    }
  ]

  investors = [
    {
      cnpj: "123456789",
      name: "Factoring Ltda",
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
      email: "seller@email.com",
      password: "123123",
      name: "Seller",
      cpf: 99999999999,
      phone_number: 11999999999,
      seller_id: 1,
      investor_id: nil,
      is_seller: true
    },

    {
      email: "seller2@email.com",
      password: "123123",
      name: "Seller 2",
      cpf: 99999999999,
      phone_number: 11999999999,
      seller_id: 2,
      investor_id: nil,
      is_seller: true
    },

    {
      email: "seller3@email.com",
      password: "123123",
      name: "Seller 3",
      cpf: 99999999999,
      phone_number: 11999999999,
      seller_id: 3,
      investor_id: nil,
      is_seller: true
    },

    {
      email: "seller4@email.com",
      password: "123123",
      name: "Seller 4",
      cpf: 99999999999,
      phone_number: 11999999999,
      seller_id: 4,
      investor_id: nil,
      is_seller: true
    },

    {
      email: "investor@email.com",
      password: "123123",
      name: "Investor",
      cpf: 99999999999,
      phone_number: 11999999999,
      seller_id: nil,
      investor_id: 1,
      is_seller: false
    }
  ]

  expenses = [

    {
      supplier: "Rent",
      value: 5000,
      due_date: "2017/12/14",
      seller_id: 1
    },

    {
      supplier: "Supplier 1",
      value: 7000,
      due_date: "2017/12/18",
      seller_id: 1
    },

    {
      supplier: "Utilities",
      value: 3000,
      due_date: "2017/12/09",
      seller_id: 1
    },

    {
      supplier: "Supplier 2",
      value: 1000,
      due_date: "2017/12/20",
      seller_id: 1
    },

    {
      supplier: "Wages",
      value: 12000,
      due_date: "2017/12/14",
      seller_id: 1
    },

    {
      supplier: "Taxes",
      value: 4000,
      due_date: "2017/12/22",
      seller_id: 1
    },

    {
      supplier: "Supplier 3",
      value: 9000,
      due_date: "2017/12/27",
      seller_id: 1
    },


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

  expenses.each do |expense|
    puts "Criando expense supplier: #{expense[:supplier]}"
    Expense.create(expense)
  end


