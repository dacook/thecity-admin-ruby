module TheCity

  class UserProcessList 

    include Enumerable

    attr_reader :total_entries, :total_pages, :per_page, :current_page

    # Constructor.
    #
    # @param [UserProcessListLoader] loader The object that loaded the data.
    def initialize(loader) 
      @json_data = loader.load_feed

      @total_entries = @json_data['total_entries']
      @total_pages = @json_data['total_pages']
      @per_page = @json_data['per_page']
      @current_page = @json_data['current_page']      
    end
    
    
    # Get the specified processes.
    #
    # @param index The index of the process to get.
    #
    # @return [UserProcesses]
    def [](index)   
      UserProcess.new( @json_data['processes'][index] ) if @json_data['processes'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['processes'].each{ |process| yield( UserProcess.new(process) )}
    end    
  
  end
  
end
