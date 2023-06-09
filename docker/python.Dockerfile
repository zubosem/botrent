# выбираем образ питона
# там уже будет стоять нужный питон
FROM python:3

# указание рабочей директории в образе
# все пути после этого будут строится относительно него
WORKDIR /usr/src/app

# скопировать локальный файл requirements.txt в рабочую директорию
COPY requirements.txt ./

# установить зависимости питона
RUN pip install --no-cache-dir -r requirements.txt

# скопировать все из корня проекта в рабочую директорию в доккере
# игнорирую файлы указанные в .dockerignore
COPY . .

# наш скрипт уже отправлен в образ
# запустить скрипт
CMD [ "python", "./apiserver.py" ]