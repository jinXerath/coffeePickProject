create user coffeepick identified by cp1234;


grant create session to coffeepick;

grant connect,resource to coffeepick;

alter user coffeepick
default tablespace users quota unlimited on users;
