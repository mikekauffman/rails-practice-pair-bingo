class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def paired_with?(other_user)
    if pairs
      pairs.each do |pair|
        return true if pair.user_id == other_user.id || pair.pair_id == other_user.id
      end
    end
    false
  end

  def pairing_date(other_user)
    pairs.each do |pair|
      return pair.date if pair.user_id == other_user.id || pair.pair_id == other_user.id
    end
  end

  def pairs
    pairs = []
    Pairing.all.map do |pair|
      if pair.user_id == id || pair.pair_id == id
        pairs << pair
      end
    end
    pairs
  end

end
