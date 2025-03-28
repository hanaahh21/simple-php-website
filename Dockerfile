#   Copyright IBM Corporation 2020
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

FROM registry.access.redhat.com/ubi8/php-74:latest
RUN printf "ServerName localhost\n\nListen 3000\n<VirtualHost *:3000>\n  ServerAdmin webmaster@localhost\n  DocumentRoot /var/www/html\n  <Directory /var/www/html>\n    Options Indexes FollowSymLinks\n    AllowOverride All\n    Require all granted\n</Directory>\n</VirtualHost>" > /etc/httpd/conf.d/site.conf
COPY . /var/www/html/
USER 10014
EXPOSE 3000
CMD ["httpd", "-D", "FOREGROUND"]
