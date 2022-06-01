#!/bin/bash
# shell script to install postgresql 11 in ubuntu 20.04

# check postgresql-11 is already installed or not
if [ -f /usr/bin/psql ]
then
    echo "postgresql is already installed"
    echo $(psql -V)
else
# update system
update_system()
{
    sudo apt update -y
}

# Import Repository Signing Key
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -


# Add PostgreSQL 11 repository
echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql-pgdg.list


# update system 
update_system


# install postrgesql 11
sudo apt install postgresql-11 -y

# check postgress service status
sudo service postgresql status

echo "Postgresql installation completed"

fi



#######################################################################################################################
# Notes #

# --> set password for postgres user
# follow this steps:
    # step 1 : login to postrgesql server
        #  sudo -i -u postgres
        #  psql
    
    # step 2 : set password for postgres role
        # ALTER USER postgres WITH PASSWORD 'yourpassword';
    
    # step 3 : modify pg_hba.conf file
        # sudo vi sudo vi /etc/postgresql/11/main/pg_hba.conf
            # replace peer authentication to md5 
                # replace "peer" to "md5" in Database administrative login section

    # step 4 : restart postrgesql service
        # sudo service postgresql restart

############################

# --> enables the database server to listen for incoming connection
# follow this steps: 
    # step 1 : edit in postgreql.conf file
        # sudo vi /etc/postgresql/11/main/postgresql.conf
            # edit listen_addresses = 'localhost,' and uncomment it
                # listen_addresses = 'localhost,ip address of the server'

    # step 2 : restart postrgesql service
           # sudo service postgresql restart    
#########################################################################################################################
