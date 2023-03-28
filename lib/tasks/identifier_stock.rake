namespace :identifier_stock do
  desc 'run create identifier stock'

  task generate: :environment do
    indices = IndicesStock.all

    indices.each do |index_stock|
      stock_identifiers = LatestStockPrice.new(index_stock.name, nil).prices

      stock_identifiers.each do |stock|
        IdentifierStock.create_or_find_by(
          indices_stock_id: index_stock.id,
          symbol_name: stock['symbol'],
          name: stock['identifier']
        )
      end
    end
    puts 'Generate Identifier Stock Success'
  end
end
