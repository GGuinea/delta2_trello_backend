# README

## Authorization not needed
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

## Authorization needed
```
header:
{
    Authorization: Bearer <token>
}
```

### Users
```
    Get /api/v1/auto_login
    simply check - will be removed
    
    Get /api/v1/all_boards
    will produce json with all boards, where users has access 
    with other users that have acces to the board
```
### Boards
```
    Get /api/v1/boards
    will give you all stored boards - will be removed

    Get /api/v1/get_users/<board-id>
    will produce json with users which has access to board

    Get /api/v1/board/<board-id>
    will produce details about board with users

    PATCH /api/v1/board/<board-id>
    consume:
        {
            'name': <new-name>
            or/and
            'description': <description>
        }
    produce:
        updated board

    DELETE /api/v1/board/<board-id>
        will produce status of migration

    PATCH /api/v1/board/member/<board-id>
    consume:
        {
            'email': <new member email>
        }
    produce:

    PATCH /api/v1/board/member/<board-id>/<user_id>
    added user to board by id

    DELETE /api/v1/board/member/<board-id>/<user-id>
    produce:
```

### Columns
```
    Get /api/v1/<board_id>/colums
    columns for board

    Post /api/v1/<board_id>/column
    consume: 
        {
            'name': <column_name>
        }

    PATCH /api/v1/column/<column_id>
    consume:
        {
            'name': <column_name>
        }

    DELETE /api/v1/column/<column_id>
        will remove column, and produce status
```

### Cards 
```
    Get /api/v1/<column_id>/cards
        will produce card for particular column 

    Post /api/v1/<column_id>/card
    consume: 
        {
            'name': <column_name>,
            'description': <description>
            'deadline': <YYYY-MM-DD>
        }

    PATCH /api/v1/card/<card_id>
    consume:
        {
            'name': <column_name> or/and
            'column_id': <new_column_id> or/and
            'description': <column_name> or/and
            'deadline': <column_name>
        }

    DELETE /api/v1/card/<card_id>
        will remove card, and produce status
```
