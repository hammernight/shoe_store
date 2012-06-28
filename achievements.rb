ACHIEVEMENTS = []

ACHIEVEMENT_NAMES_AND_DESCRIPTIONS = {
    'MultipleIpAddresses' => "Used the application from a different IP address",
    'EmptyFormSubmission' => "Submitted a blank form (without selecting or filling in any fields)",
    'UsedUnknownBrowser' => "Used an unknown browser to access the application",
    'UsedInternetExplorer_6' => "Used Internet Explorer 6 to access the application",
    'UsedInternetExplorer_7' => "Used Internet Explorer 7 to access the application",
    'UsedInternetExplorer_8' => "Used Internet Explorer 8 to access the application",
    'UsedFirefox' => "Used Mozilla Firefox to access the application",
    'UsedChrome' => "Used Google Chrome to access the application",
    'UsedSafari' => "Used Safari to access the application",
    'UsedOpera' => "Used Opera to access the application",
    'PromoCodeSqlInjection' => "Has attempted a SQL injection attack on the 'promotional code' field",
    'EmailSqlInjection' => "Has attempted a SQL injection attack on the 'email' field",
    'AvailableEmailSqlInjection' => "Has attempted a SQL injection attack on the 'available email' field",
    'PromoCodeCrossSiteScripting' => "Has attempted a cross-site-scripting attack on the 'promotional code' field",
    'EmailCrossSiteScripting' => "Has attempted a cross-site-scripting attack on the 'email' field",
    'AvailableEmailCrossSiteScripting' => "Has attempted a cross-site-scripting attack on the 'available email' field",
    'HackedPromoCodeSize' => "Has attempted to hack promotional codes with more than 255 characters",
    'PromoCodeSize' => "Has attempted to use a promotional code with more than 100 characters",
    'ImpossibleSchedule' => "Has attempted a schedule that is not possible",
    'SeatsAvailable' => "Has seen the 'Seats available!' message",
    'UsedPromocode' => "Has attempted a search using a promotional code",
    'NoSeatsAvailable' => "Has attempted a search that had no seats available",
    'ZeroDiscountPromocode' => "Has attempted to use a promotional code with 0% discount",
    'ValidPromoCode' => "Has used a valid promotional code in a search",
    'InvalidPromoCode' => "Has used an invalid promotional code in a search",
    'CreatedIssue' => "Has created at least one issue"
}

class Achievement < ActiveRecord::Base
  belongs_to :request

  def self.earned_types
    all.collect(&:type).uniq
  end

  def self.inherited(child)
    ACHIEVEMENTS << child
    super
  end
end

def create_achievement_class(achievement_name, description)
  klass = Class.new Achievement
  Object.const_set achievement_name, klass
  klass.define_singleton_method(:description) do
    description
  end
end

ACHIEVEMENT_NAMES_AND_DESCRIPTIONS.each_pair { |name, desc| create_achievement_class(name, desc) }


