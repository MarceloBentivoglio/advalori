module ApplicationHelper
  def capitalize_words(sentence)
    sentence.split.map(&:capitalize).join(' ')
  end
end
