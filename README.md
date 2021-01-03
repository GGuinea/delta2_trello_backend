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
            'backgroud_id': <int:backgroud_id>
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
### Labels
```
post /api/v1/<board_id>/label
    consume: 
        {
            'name': <string:column_name>,
            'color_id': <int:color_id>
        }
    will create label for whole board

post /api/v1/<card_id>/<label_id>
    will assign label to card

delete /api/v1/label/<label_id>
    will remove label from board

patch /api/v1/label/<label_id>
    consume: 
        {
            'name': <string:column_name>,
            'color_id': <int:color_id>
        }
    will update label

delete /api/v1/<card_id>/<label_id>
    will remove label from card

```

### tasks
```
get /api/v1/<card_id>/tasks
    will return tasks for card

post /api/v1/add/task/<card_id>
    consume: 
        {
            'name': <string:column_name>,
            'done': <bool:is_done>
        }
    will create new tasks for card

patch /api/v1/task/<task_id>
    consume: 
        {
            'name': <string:column_name>,
            'done': <bool:is_done>
        }
    will update pointed task

delete /api/v1/task/<task_id>
    will remove pointed task

```





```
