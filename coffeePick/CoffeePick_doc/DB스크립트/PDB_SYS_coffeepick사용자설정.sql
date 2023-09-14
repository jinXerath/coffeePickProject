create user coffeepick identified by cp1234;

grant connect, resource to coffeepick;

alter user coffeepick
default tablespace users quota unlimited on users;