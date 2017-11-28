require 'aws-sdk-core'
Aws.use_bundled_cert!

require 'aws-sdk-dynamodb'  # v2: require 'aws-sdk'

puts "Enter a test value to be added to the DB, then press RETURN"

DEValue = gets.chomp

dynamoDB = Aws::DynamoDB::Resource.new(region: 'us-east-1')

table = dynamoDB.table('TestTable')

table.put_item({
  item:
    {
      "TestKey" => DEValue
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









