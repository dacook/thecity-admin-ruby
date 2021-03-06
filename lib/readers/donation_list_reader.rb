module TheCity

  class DonationListReader < ApiReader

    # Constructor.
    #
    # @param page The page number to get.  Default is 1.
    # @param options A hash of options for requesting data from the server.
    # @param [CacheAdapter] cacher (optional) The cacher to be used to cache data.
    def initialize(options = {}, cacher = nil) 
      options[:page] ||= 1

      #@class_key = "pledge_list_#{options[:page]}_{some_kind_of_md5_thing_here}"  
      @url_data_path = "/donations"
      @url_data_params = white_list_options(options)
      
      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?    
    end

    def white_list_options(options)
      white_list = [:page, :fund_id, :state, :group_id, :user_id, :start_date, :end_date, :paginate, :page, :per_page]
      options.clone.delete_if { |key, value| !white_list.include?(key) }
    end

  end

end
