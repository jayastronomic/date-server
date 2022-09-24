class UserSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    attributes :id, :email, :name, :bio, :age, :gender, :birth_date, :logged_in, :avatar_exist, :avatar_url

    def logged_in
        @instance_options[:logged_in]
    end

    def avatar_exist
        object.avatar.attached?
    end

    def avatar_url
        if avatar_exist then url_for(object.avatar) else false end
    end

    def images_exist
        object.images.attached? 
    end

    def images
        object.images.map do |image|
            url_for(image)
        end
    end
end