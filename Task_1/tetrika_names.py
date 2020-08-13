alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

# Создание списка имен из файла и сортировка по алфавиту
f = open('names.txt')
list_names = f.readline()
f.close()

list_names = list_names.split(",")

list_names.sort()

# Объявление переменных
name_sum = 0 # алфавитная сумма имени
name_multiply = 0 # произведение суммы имени на порядковый номер
total_sum = 0 # итоговая сумма

# Расчеты
for name in list_names:
    for i in name:    
        if i != '"':
            name_sum += alphabet.index(i) + 1
    name_order = list_names.index(name) + 1 # порядковый номер имени       
    name_multiply = name_sum * name_order
    total_sum += name_multiply

print(total_sum)
