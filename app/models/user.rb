class User < ApplicationRecord
  after_destroy :ensure_an_admin_remains
  validates :name, presence: true, uniqueness: true
  has_secure_password

  private

  def ensure_an_admin
    if User.count.zero?
      raise Error.new "Can't delete last user"
    end
  end
end
