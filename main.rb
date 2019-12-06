files = %w[
  present_statement present_question
  future_statement future_question
]

frazes = {
  present_statement: [], present_question: [],
  future_statement: [], future_question: []
}

# 1. Собираем фразы из файлов и сортируем по временам
files.each do |file|
  file_path = "./dictionary/#{file}.txt"
  if File.exist?(file_path)
    f = File.new(file_path, "r:UTF-8")
    frazes[file.to_sym] = f.readlines
    f.close
  else
    puts "'#{file_path}' не существует! Убедитесь, что вы загрузили все файлы c фразами"
    break
  end
end

# 2. Рандомно выбираем фразу по времени и форме
time = %w[present future]
sentence = %w[statement question]

loop do
  structure = "#{time.sample}_#{sentence.sample}"

  puts "#{frazes[structure.to_sym].sample.chomp}\n"

  # Комманды на ввод для выхода
  command = gets.encode("UTF-8").chomp
  break if command == 'exit'
end
