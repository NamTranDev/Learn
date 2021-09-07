const DB_NAME = 'todo.db';
const DB_VERSION = 1;
const TODO_TABLE_NAME = 'todo';
const CREATE_TABLE_TODO = '''
  CREATE TABLE $TODO_TABLE_NAME (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    content STRING
  )
''';
