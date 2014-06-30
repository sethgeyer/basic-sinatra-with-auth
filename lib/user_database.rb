class UserDatabase
  def initialize
    @users = []
  end

  def insert(user)
    validate!(user, :username, :password)

    user = user.dup
    user[:id] = next_id

    @users.push(user)

    user
  end

  def find(id)
    @users[id - 1]
  end

  private

  def validate!(user, *attributes)
    invalid_attributes = attributes.select { |a| !user.has_key?(a) }

    if invalid_attributes.any?
      message = "#{invalid_attributes.join(", ")} required"
      raise ArgumentError, message
    end
  end

  def next_id
    @users.length + 1
  end
end