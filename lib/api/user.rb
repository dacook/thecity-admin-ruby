module TheCity

  class User < ApiObject
    attr_accessor :active,
                  :admin_url,
                  :api_url,
                  :birthdate,
                  :contact_updated_at,
                  :created_at,
                  :email,
                  :email_bouncing,
                  :external_id_1,
                  :external_id_2,
                  :external_id_3,
                  :first,
                  :gender,
                  :head_of_household,
                  :id,
                  :in_community,
                  :in_connect,
                  :in_service,
                  :last,
                  :last_attendance_date,
                  :last_checkin_date,
                  :last_donation_date,
                  :last_engaged,
                  :last_logged_in,
                  :marital_status,
                  :member_since,
                  :middle,
                  :nickname,
                  :primary_phone,
                  :primary_phone_type,
                  :secondary_phone,
                  :secondary_phone_type,
                  :spouse_id,
                  :spouse_name,
                  :staff,
                  :title,
                  :type,
                  :updated_at            


    # Loads the user by the specified ID
    #
    # <b>user_id</b> The ID of the user to load.
    #
    # Returns a new TheCity::User object.
    def self.load_user_by_id(user_id)
      user_loader = UserLoader.new(user_id)
      self.new(user_loader)
    end       



    # Constructor.
    #
    # @param Mixed loader (optional) The object that has the data.  This can be a UserLoader or Hash object.
    def initialize(loader = nil)
      if loader.is_a?(UserLoader)
        initialize_from_json_object(loader.load_feed) 
      elsif loader.is_a?(Hash)
        initialize_from_json_object(loader)
      end
    end
    
    # The first and last name of the user.
    def full_name
      use_name = self.nickname || self.first
      [use_name, self.last].compact.join(' ')
    end
  end

end


