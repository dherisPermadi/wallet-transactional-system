namespace :identifier_stock do
  desc 'run create identifier stock'

  task generate: :environment do
    stock_identifiers = LatestStockPrice.new(nil, nil).prices_all

    stock_identifiers.each do |stock|
      IdentifierStock.create_or_find_by(
        symbol_name: stock['symbol'],
        name: stock['identifier']
      )
    end
    puts 'Generate Identifier Stock Success'
  end
end
