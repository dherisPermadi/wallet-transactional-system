namespace :indices_stock do
  desc 'run create indices stock'

  task generate: :environment do
    indices = ['NIFTY 50', 'NIFTY NEXT 50', 'NIFTY 100', 'NIFTY 200', 'NIFTY 500',
      'NIFTY MIDCAP 50', 'NIFTY MIDCAP 100', 'NIFTY MIDCAP 150', 'NIFTY SMLCAP 50',
      'NIFTY SMLCAP 100', 'NIFTY SMLCAP 250', 'NIFTY MIDSML 400', 'NIFTY BANK',
      'NIFTY AUTO', 'NIFTY FINSRV25 50', 'NIFTY FIN SERVICE', 'NIFTY SMLCAP 50',
      'NIFTY FMCG', 'NIFTY IT', 'NIFTY MEDIA', 'NIFTY METAL', 'NIFTY INFRA',
      'NIFTY ENERGY', 'NIFTY PHARMA', 'NIFTY PSU BANK', 'NIFTY PVT BANK',
      'NIFTY REALTY', 'NIFTY MNC', 'NIFTY PSE', 'NIFTY SELV SECTOR'
    ]

    indices.each do |name|
      IndicesStock.create_or_find_by(name: name)
    end

    puts 'Generate Indices Stock Success'
  end
end
