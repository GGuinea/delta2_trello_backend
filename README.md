# README

##Authorization not needed
```
    Post:
    /api/v1/users
        {
            email
            username
            password
        }
    will create user
```

```
    Post:
    /api/v1/login
        {
            username
            password
        }
    will logIn user and generate json web token
```

##Authorization needed
```
    Get
    /api/v1/auto_login
    header:
    {
        Authorization: Beare <token>
    }
    simply check
```

```
    Get
    /api/v1/boards
    
    will give you all stored boards
```
