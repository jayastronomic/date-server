class UserSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    attributes :email, :name, :bio, :age, :birth_date, :logged_in

    def logged_in
        @instance_options[:logged_in]
    end
end