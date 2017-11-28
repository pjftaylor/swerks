require 'aws-sdk-core'
Aws.use_bundled_cert!

require 'aws-sdk-dynamodb'  # v2: require 'aws-sdk'

# Create dynamodb client in us-east-1 region
dynamodb = Aws::DynamoDB::Client.new(region: 'us-east-1')

dynamodb.tables['TestTable']

item1 = TestTable.items.Create (
  :TestKey => '001'
  )

