class BusinessEntity < ActiveRecord::Base

  has_many :leads, :foreign_key => 'interested_company_id'

  def name_short_or_name
    name_short.presence || name.presence || 'Name not set'
  end
end