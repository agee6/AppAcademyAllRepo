class Contact < ActiveRecord::Base
  validates :user_id, presence: true
  validates :email, presence: true, uniqueness: {scope: :user_id}
  validates :name, presence: true
  belongs_to :user
  has_many :contact_shares
  has_many :shared_users, through: :contact_shares, source: :user
end
