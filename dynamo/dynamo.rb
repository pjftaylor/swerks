require 'aws-sdk-dynamodb'  # v2: require 'aws-sdk'
require 'aws-sdk-core'
Aws.use_bundled_cert!


dynamoDB = Aws::DynamoDB::Resource.new(region: 'us-east-1')

table = dynamoDB.table('TestTable')

class Keys
		field :TestKey, type: String
end

get '/ ' do  
  'Welcome to BookList!'
end
