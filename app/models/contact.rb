class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :contact_shares
  has_many :shared_users, through: :contact_shares
end
