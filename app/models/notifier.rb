class Notifier
  # novy zajemce o clenstvi
  def self.new_membership_request(person)
    MemberNotifications.registered(person).deliver
    PresidiumNotifications.member_registered(person).deliver
  end

  # novy radny clen
  def self.new_regular_member(person)
    MemberNotifications.regular(person).deliver
    PresidiumNotifications.new_regular_member(person).deliver
    #CoordinatorNotifications.new_regular_member(person).deliver if person.domestic_branch
  end

  # novy zaplaceny priznivce
  def self.new_regular_supporter(person)
    SupporterNotifications.regular(person).deliver
    PresidiumNotifications.new_regular_supporter(person).deliver
  end
end
