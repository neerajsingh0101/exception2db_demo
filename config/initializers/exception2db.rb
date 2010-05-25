HoptoadNotifier.configure do |config|
end

module HoptoadNotifier
  def self.send_notice(data)
    RAILS_DEFAULT_LOGGER.info data.inspect
    Exception2db.create(:exception => data.to_xml)
  end
end

Exception2dbConfig.set = {
  :is_allowed_to_view => lambda {|controller| 2 == 2 }
}

AdminDataConfig.set = {
  :is_allowed_to_view => lambda {|controller| 2 == 2 }
}

