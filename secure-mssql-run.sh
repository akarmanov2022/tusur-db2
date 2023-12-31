mkdir ssl && cd ssl || exit
openssl req -x509 -nodes -newkey rsa:2048 -subj '/CN=mssql1.contoso.com' -keyout ./mssql.key -out ./mssql.pem -days 365


docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" -u 0:0 -p 5434:1433 --name mssql1 -h mssql1 -v ./ssl/mssql.conf:/var/opt/mssql/mssql.conf -v ./ssl/mssql.pem:/etc/ssl/certs/mssql.pem -v ./ssl/mssql.key:/etc/ssl/private/mssql.key -d mcr.microsoft.com/mssql/server:2019-latest