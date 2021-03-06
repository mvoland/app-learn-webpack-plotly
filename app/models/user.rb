class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wheel_values

  has_many :coach_coachings, foreign_key: :coach_id, class_name: :Coaching
  has_many :student_coachings, foreign_key: :student_id, class_name: :Coaching

  has_many :students, through: :coach_coachings
  has_many :coaches, through: :student_coachings

  after_create :welcome_email

  def coach_of?(user)
    students.any? { |s| s == user }
  end

  def student_of_current_user
    coaches.any? { |c| c == current_user }
  end

  private

  def welcome_email
    # Deliver the mail to the user
    # --------------------------------
    # See https://stackoverflow.com/questions/8709984/how-to-catch-error-exception-in-actionmailer

    UserMailer.with(user: self).welcome_email.deliver_now
  rescue Exception => e
  end
end
