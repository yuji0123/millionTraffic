json.array!(@items) do |item|
  json.extract! item, :id, :itemId, :itemSupplier, :itemStockQuantity, :itemBasePrice, :itemTags
  json.url item_url(item, format: :json)
end
