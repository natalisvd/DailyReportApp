class Lead < ActiveRecord::Base

  belongs_to :interested_company, :class_name => 'BusinessEntity'


  scope :not_spam, -> { where('status not in (?)', %w(spam)) }
  scope :closed, -> { where('status not in (?)', %w(closed job_done)) }

  def self.apply_filter(filter)
    if %w(all not_spam closed).include? filter
      public_send filter
    end
  end
  def self.to_csv
    CSV.generate do |csv|
      csv << ["Date", 'Leads count']
      lead_date = all.pluck(:created_at).uniq
      lead_date.each do |lead_date|
        csv << [lead_date, all.where(:created_at=> lead_date).count]
      end
    end
  end

end