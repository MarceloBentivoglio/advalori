# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
    city:"Sao Paulo"
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
      city:"Marilia"
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
  sellers.each do |seller|
    puts "Criando seller cidade: #{seller[:city]}"
    sel = Seller.new(seller)
    sel.save!
  end
  invoice_payers.each do |invoice|
    puts "Criando invoicepayer cidade: #{invoice[:city]}"
    InvoicePayer.create(invoice)
  end

