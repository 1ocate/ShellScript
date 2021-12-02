#e "^H"
#!/bin/sh

echo "Input you want create db_name"
read db_name

echo "Input $db_name user"
read user

echo "Input $db_name $user password"
read password


while [  "$db_name" == "" ] || [ "$user" == "" ] || [ "$password" == "" ]
do
        echo -e "Plz input all\n"
        echo "Input you want create db_name"
        read db_name
        echo "Input $db_name user"
        read user
        echo "Input $db_name $user password"
        read password
done

echo  "dbname:$db_name user:$user password:$password"
echo r u sure?
read re
if [ "$re" == "y" -o "Y" ]
then
echo input admin_passwd
read admin_pw

docker exec -it mysql mysql -uroot -p$admin_pw -e "create database $db_name; \n
grant all privileges on $db_name.* to $user@'%' identified by '$password' with grant option; \n
flush privileges;"
echo "You must have checkup! bye"

else
echo "Have a nice day ^^"
fi
