require_relative 'delivery_helper.rb'

task :shipping, [:delivery_on] => [:environment] do |t, args|
  puts "Processing..."
  DeliveryHelper.shipping(args[:delivery_on])
  puts "Done."
rescue ActiveRecord::RecordInvalid
  puts "Something went wrong!"
end
