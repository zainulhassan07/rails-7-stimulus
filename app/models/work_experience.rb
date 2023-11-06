class WorkExperience < ApplicationRecord
  EMPLOYMENT_TYPE = ['full time', 'Part time', 'Self Employed', 'Freelance', 'Part time', 'Trainee']
  LOCATION_TYPE = ['On site', 'Hybrid', 'Remote']
  
  belongs_to :user

  validates :company, :start_date, :job_title, :location, presence: true
  validates :employment_type, presence: true, inclusion: {in: EMPLOYMENT_TYPE, message: 'not a valid employment type' }
  validates :location_type, presence: true, inclusion: {in: LOCATION_TYPE, message: 'not a valid location type'}
  validate :work_experience_last_date
  validate :presence_of_end_date
  validate :end_date_must_after_start_date, if: :currently_not_working_here?

  
  def work_experience_last_date
    if end_date.present? && current_working_here
      errors.add(:end_date, 'must be blank if you are currently working in this company')
    end
  end

  def presence_of_end_date
    if end_date.nil? && !current_working_here
      errors.add(:end_date, 'must be present if you are not currently working in this company')
    end
  end

  def currently_not_working_here?
    !current_working_here
  end

  def end_date_must_after_start_date
    return if end_date.nil?
    
    if end_date < start_date
      errors.add(:end_date, 'must after the start date')
    end
  end
end
