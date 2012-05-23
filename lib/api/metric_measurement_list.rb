module TheCity

  class MetricMeasurementList 

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserRoleListLoader] loader The object that loaded the data.
    def initialize(loader) 
      @json_data = loader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified user role.
    #
    # @param index The index of the user role to get.
    #
    # @return [UserRole]
    def [](index)
      MetricMeasurement.new( @json_data['measurements'][index] ) if @json_data['measurements'][index]
    end
  
  end
  
end
