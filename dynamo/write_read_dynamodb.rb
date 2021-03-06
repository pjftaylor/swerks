#PJFT

require 'aws-sdk-core'
Aws.use_bundled_cert!

require 'aws-sdk-dynamodb'  # v2: require 'aws-sdk'

puts "Enter a test value to be added to the DB, then press RETURN"

addValue = gets.chomp

dynamoDB = Aws::DynamoDB::Resource.new(region: 'us-east-1')

table = dynamoDB.table('TestTable')

###########################################

table.put_item({
  item:
    {
      "TestKey" => addValue
}})

scan_output = table.scan({
  limit: 50,
  select: "ALL_ATTRIBUTES"
})

scan_output.items.each do |item|
  keys = item.keys

  keys.each do |k|
    puts "#{k}: #{item[k]}"
  end
end

############################################

puts "Press RETURN to continue"
x = gets

puts "Enter a test value to be REMOVED to the DB, then press RETURN"

remValue = gets.chomp

params = {
    table_name: 'TestTable',
    key: {
        TestKey: remValue
    }
}
table.delete_item(params)
puts 'Deleted the selected item'

scan_output = table.scan({
  limit: 50,
  select: "ALL_ATTRIBUTES"
})

scan_output.items.each do |item|
  keys = item.keys

  keys.each do |k|
    puts "#{k}: #{item[k]}"
  end
end


