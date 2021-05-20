# == Schema Information
#
# Table name: people
#
#  id       :bigint           not null, primary key
#  name     :string           not null
#  house_id :integer          not null
#
class Person < ApplicationRecord
    validates :name, presence: true
    validates :house_id, presence: true

    belongs_to :house, 
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :House
    
    # validate(:check_name_length)

    # def check_name_length
    #     unless self.name.length >= 4
    #         errors[:name] << "is too short; must be longer than 3 characters."
    #     end
    # end
end
