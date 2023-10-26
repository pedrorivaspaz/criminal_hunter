class Wanted < ApplicationRecord
  scope :search_by_nome, ->(nome) {
    where("nome ILIKE ?", "%#{nome}%").order(:id)
  }
end
