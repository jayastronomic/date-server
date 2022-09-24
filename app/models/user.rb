class User < ApplicationRecord
    has_secure_password
    has_one_attached :avatar, dependent: :destroy
    has_many_attached :images, dependent: :destroy
end
