class PresidiumNotifications < ActionMailer::Base
  default from: "kancelar@svobodni.cz",
          bcc: "kubicek@svobodni.cz",
          content_transfer_encoding: 'text/plain'

  def member_registered(person)
    @person = person
    mail to: @person.domestic_region.presidium.presidium_emails, subject: "Nový zájemce o členství"
  end

  def new_regular_member(person)
    @person = person
    mail to: @person.domestic_region.presidium.presidium_emails, subject: "svobodni.cz - nový člen zaplatil"
  end

end
