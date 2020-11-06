# README

```
    Post:
    /api/v1/users
        {
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

```
    Get
    /api/v1/auto_login
    header:
    {
        Authorization: Beare <token>
    }
    simply check
```
