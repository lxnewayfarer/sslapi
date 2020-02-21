# при использовании, показывает только домен, id и дату создания
# в удобном человеку формате

module Entities
  class DomainEntity < Grape::Entity
    format_with(:iso_timestamp) { |dt| dt.strftime("%d/%m/%Y %T") }
    expose :id
    expose :domain
    with_options(format_with: :iso_timestamp) do
      expose :created_at, as: :created
    end
  end
end
