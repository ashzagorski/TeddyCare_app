class DocumentedAnswer < ApplicationRecord
  belongs_to :visit
  belongs_to :possible_answer
end
