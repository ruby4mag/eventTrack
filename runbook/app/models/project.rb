class Project < ActiveRecord::Base
has_many :devices, dependent: :destroy
end
