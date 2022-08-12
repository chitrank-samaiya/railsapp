## Interview Management System

### How to  run the application via docker
0. Git clone/update ims repository. 
    
    ```git clone git@github.com:chitrank-samaiya/railsapp.git ../ims```


1. To build and run ims and db containers 
    
    ```docker-compose up```

2. To seed the data (required after first run) 
    
    ```docker-compose exec ims rake db:seed```

3. To bring all the containers down 
    
    ```docker-compose down```

4. To build only IMS containers 
    
    ```docker-compose build ims```

5. To bring up db instance only 
    
    ```docker-compose up db```

6. To execute rails console 
    
    ```docker-compose exec ims rails console```

6. To execute rails dbconsole 
    
    ```docker-compose exec ims rails dbconsole```

7. To get shell access on ims 
    
    ```docker-compose exec ims bash```

7. To run specs 
    
    ```docker-compose exec ims rspec .```

8. To access db's mysql over host 
    
    ```mysql -u root -proot -h 127.0.0.1 -P 3307```
