class TimelineEvent < ActiveRecord::Base
  belongs_to :actor,              polymorphic: true
  belongs_to :subject,            polymorphic: true
  belongs_to :secondary_subject,  polymorphic: true

  attr_accessible :actor, :subject, :event_type, :secondary_subject

  default_scope order('created_at DESC')
end
