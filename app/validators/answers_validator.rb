class AnswersValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    splited_value = value.delete(' ').split(';')

    record.errors[attribute] << (options[:message] || "amount mustn't be more than 3") if splited_value.size > 3
  end
end
