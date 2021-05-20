# == Schema Information
#
# Table name: houses
#
#  id      :bigint           not null, primary key
#  address :string           not null
#
class House < ApplicationRecord
    validates :address, presence: true, uniqueness: true

    has_many :residents, 
        primary_key: :id,
        foreign_key: :resident_id,
        class_name: :Person

    


    # validate(:check_name_length)

    # def check_name_length
    #     unless self.name.length >= 4
    #         errors[:name] << "is too short; must be longer than 3 characters."
    #     end
    # end
end
