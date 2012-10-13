class Connection < ActiveRecord::Base
  belongs_to :source, class_name: 'User'
  belongs_to :destination, class_name: 'User'

  after_create :update_mutual

  fires :new_connection, on: :create, actor: :source, secondary_subject: :destination

  def update_mutual
    return if mutual?
    if reverse = Connection.find_by_source_id_and_destination_id(destination_id, source_id)
      update_attribute(:mutual, true)
      reverse.update_attribute(:mutual, true)
    end
  end
end
