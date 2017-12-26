from ruby
run apt-get update -y
run apt-get install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev nodejs
run gem install rails
run mkdir doan
workdir /doan
expose 3000
add . /doan
run bundle install     
run rm /etc/localtime
run ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
run apt-get install ngrok-client -y