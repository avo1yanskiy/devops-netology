# devops-netology
devops-netology


# игнорировать каталог терраформа
**/.terraform/*

# проигнорирован с любые файьы заканчивающиеся на  .tfstate
# проигнорирован файл который начинается с любого названия (*) и заканчивается любым названием 
*.tfstate
*.tfstate.*

# Файл crash.log
crash.log

#проигнорирован любой файлы оканчивающиеся на .tfvars
*.tfvars

# проигнорирован файл с названием override.tf
# проигнорирован файл с названием override.tf.json
# проигнорирован файл с любым названием оканчивающийся на _override.tf
# проигнорирован файл с любым названием оканчиваюшийся на _override.tf.json
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# проигнорирован файл оканчивающийся на .terraformrc
# проигнорирован файл с названием terraform.rc
.terraformrc
terraform.rc
new line
