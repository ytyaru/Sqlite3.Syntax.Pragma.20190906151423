SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 a.db ".quit"
sqlite3 a.db "pragma application_id;"
file a.db

sqlite3 :memory: "pragma auto_vacuum;"
sqlite3 :memory: "pragma auto_vacuum=1;" "pragma auto_vacuum;"
sqlite3 :memory: "pragma auto_vacuum=2;" "pragma auto_vacuum;"

sqlite3 :memory: "pragma automatic_index;"
sqlite3 :memory: "pragma automatic_index=0;" "pragma automatic_index;"

sqlite3 :memory: "pragma busy_timeout;"
sqlite3 :memory: "pragma busy_timeout=5000;" "pragma busy_timeout;"

sqlite3 :memory: "pragma cache_size;"
sqlite3 :memory: "pragma busy_timeout=5000;" "pragma busy_timeout;"

sqlite3 :memory: "pragma cache_spill;"
sqlite3 :memory: "pragma cache_spill=500;" "pragma cache_spill;"
sqlite3 :memory: \
"pragma      cache_spill=500;" \
"pragma      cache_spill;" \
"pragma temp.cache_spill;"

sqlite3 :memory: "pragma case_sensitive_like;"
sqlite3 :memory: "select 'A' like '%a%';"
sqlite3 :memory: \
"pragma case_sensitive_like = true;" \
"select 'A' like '%a%';"
sqlite3 :memory: \
"pragma case_sensitive_like = false;" \
"select 'A' like '%a%';"

sqlite3 :memory: "pragma cell_size_check;"
sqlite3 :memory: "pragma cell_size_check=1;" "pragma cell_size_check;"

sqlite3 :memory: "pragma checkpoint_fullfsync;"
sqlite3 :memory: "pragma checkpoint_fullfsync=1;" "pragma checkpoint_fullfsync;"

sqlite3 :memory: "pragma collation_list;"
sqlite3 :memory: "select * from pragma_collation_list;"

sqlite3 :memory: "pragma compile_options;"
sqlite3 :memory: "select * from pragma_compile_options;"
sqlite3 :memory: "select sqlite_compileoption_get(0);"
sqlite3 :memory: \
"with recursive opts(idx,opt) as (values(-1,'') union select idx+1, sqlite_compileoption_get(idx + 1) from opts where opt is not NULL) select * from opts;"

sqlite3 :memory: "pragma count_changes;"
sqlite3 :memory: "pragma count_changes=1;" "pragma count_changes;"

sqlite3 :memory: "pragma data_version;"

sqlite3 :memory: "pragma database_list;"
sqlite3 :memory: "select * from pragma_database_list;"
sqlite3 :memory: ".headers on" "pragma database_list;"

sqlite3 :memory: "pragma default_cache_size;"

sqlite3 :memory: "pragma defer_foreign_keys;"
sqlite3 :memory: "pragma defer_foreign_keys=1;" "pragma defer_foreign_keys;"

sqlite3 :memory: "pragma empty_result_callbacks;"

sqlite3 :memory: "pragma encoding;"
sqlite3 :memory: "pragma encoding = 'UTF-16';" "pragma encoding;"
sqlite3 :memory: "pragma encoding = 'UTF-16le';" "pragma encoding;"
sqlite3 :memory: "pragma encoding = 'UTF-16be';" "pragma encoding;"

sqlite3 :memory: "pragma foreign_key_check;"
sqlite3 :memory: \
"create table T(A integer primary key);" \
"create table U(B integer references T(A));" \
"insert into U values(9);" \
".headers on" \
"pragma foreign_key_check;"
sqlite3 :memory: \
"create table T(A integer primary key);" \
"create table U(B integer references T(A));" \
"insert into T values(9);" \
"insert into U values(9);" \
".headers on" \
"pragma foreign_key_check;"
sqlite3 :memory: \
"create table T(A integer primary key);" \
"create table U(B integer references T(A));" \
"insert into U values(9);" \
".headers on" \
"select * from pragma_foreign_key_check;"

sqlite3 :memory: \
"create table T(A integer primary key);" \
"create table U(B integer references T(A));" \
".headers on" \
"pragma foreign_key_list(U);"
sqlite3 :memory: \
"create table T(A integer primary key);" \
"create table U(B integer references T(A));" \
"insert into U values(9);" \
".headers on" \
"pragma foreign_key_list;"
sqlite3 :memory: \
"create table T(A integer primary key);" \
"create table U(B integer references T(A));" \
".headers on" \
"select * from pragma_foreign_key_list('U');"

sqlite3 :memory: "pragma foreign_keys;"
sqlite3 :memory: "pragma foreign_keys=1;" "pragma foreign_keys;"

sqlite3 :memory: "pragma freelist_count;"

sqlite3 :memory: "pragma full_column_names;"

sqlite3 :memory: "pragma fullfsync;"

sqlite3 :memory: ".headers on" "pragma function_list;"
sqlite3 :memory: ".headers on" "select * from pragma_function_list;"

sqlite3 :memory: "pragma ignore_check_constraints;"
sqlite3 :memory: "pragma ignore_check_constraints=1;" "pragma ignore_check_constraints;"

sqlite3 :memory: "pragma incremental_vacuum;"
sqlite3 :memory: "pragma auto_vacuum = incremental;" "pragma incremental_vacuum;"

sqlite3 :memory: \
"create table T(A text);" \
"create index T_A on T(A);" \
".headers on" \
"pragma index_info(T_A);"
sqlite3 :memory: \
"create table T(A text);" \
"create index T_A on T(A);" \
".headers on" \
"select * from pragma_index_info('T_A');"

sqlite3 :memory: \
"create table T(A text);" \
"create index T_A on T(A);" \
".headers on" \
"pragma index_list(T);"
sqlite3 :memory: \
"create table T(A text);" \
"create index T_A on T(A);" \
".headers on" \
"select * from pragma_index_list('T');"

sqlite3 :memory: \
"create table T(A integer primary key, B text unique, C text, D text);" \
".headers on" \
"pragma index_list(T);"
sqlite3 :memory: \
"create table T(A integer primary key, B text unique, C text, D text);" \
"create index T_B on T(B);" \
"create index T_C on T(C);" \
".headers on" \
"pragma index_list(T);" \
".echo on" \
"pragma index_xinfo(sqlite_autoindex_T_1);" \
"pragma index_xinfo(T_B);" \
"pragma index_xinfo(T_C);"
sqlite3 :memory: \
"create table T(A integer primary key, B text unique, C text, D text);" \
"create index T_B on T(B);" \
"create index T_C on T(C);" \
".headers on" \
"pragma index_list(T);" \
".echo on" \
"select * from pragma_index_xinfo('sqlite_autoindex_T_1');" \
"select * from pragma_index_xinfo('T_B');" \
"select * from pragma_index_xinfo('T_C');"

sqlite3 :memory: "pragma integrity_check;"
sqlite3 :memory: "pragma integrity_check(300);"

sqlite3 :memory: "pragma journal_mode;"
sqlite3 a.db "pragma journal_mode;"
sqlite3 a.db "pragma journal_mode=PERSIST;" "pragma journal_mode;"
sqlite3 a.db "pragma journal_mode=MEMORY;" "pragma journal_mode;"
sqlite3 a.db "pragma journal_mode=WAL;" "pragma journal_mode;"
sqlite3 a.db "pragma journal_mode=OFF;" "pragma journal_mode;"

sqlite3 a.db "pragma journal_size_limit;"
sqlite3 a.db "pragma journal_size_limit=0;"
sqlite3 a.db "pragma journal_size_limit=1024;"

sqlite3 :memory: "pragma legacy_alter_table;"

sqlite3 :memory: "pragma legacy_file_format;"

sqlite3 :memory: "pragma locking_mode;"
sqlite3 :memory: "pragma locking_mode=EXCLUSIVE;"

sqlite3 :memory: "pragma max_page_count;"

sqlite3 :memory: "pragma mmap_size;"

sqlite3 :memory: "pragma module_list;"
sqlite3 :memory: "select * from pragma_module_list;"

sqlite3 :memory: "pragma optimize;"
sqlite3 :memory: "pragma optimize(-1);"

sqlite3 :memory: "pragma page_count;"

sqlite3 :memory: "pragma page_size;"

sqlite3 :memory: "pragma pragma_list;"
sqlite3 :memory: "select * from pragma_pragma_list;"

sqlite3 :memory: "pragma query_only;"
sqlite3 :memory: \
"pragma query_only=1;" \
"create table T(A text);"

sqlite3 :memory: "pragma quick_check;"

sqlite3 :memory: "pragma read_uncommitted;"

sqlite3 :memory: "pragma recursive_triggers;"
sqlite3 :memory: "pragma recursive_triggers=1;" "pragma recursive_triggers;"

sqlite3 :memory: "pragma reverse_unordered_selects;"
sqlite3 :memory: "pragma reverse_unordered_selects=1;" "pragma reverse_unordered_selects;"
sqlite3 :memory: \
"pragma reverse_unordered_selects=1;" \
"select 1 union select 2;"

sqlite3 :memory: "pragma schema_version;"

sqlite3 :memory: "pragma secure_delete;"

sqlite3 :memory: "pragma short_column_names;"

sqlite3 :memory: "pragma shrink_memory;"

sqlite3 :memory: "pragma soft_heap_limit;"

sqlite3 :memory: "pragma synchronous;"

sqlite3 :memory: \
"create table users(\
  id   integer primary key,\
  name text    unique not null,\
  age  integer default 0 check(0<=age),\
  cid  references classes(id)\
);" \
"create table classes(id integer primary key);" \
".headers on" \
"pragma table_info(users);"
sqlite3 :memory: \
"create table users(\
  id   integer primary key,\
  name text    unique not null,\
  age  integer default 0 check(0<=age),\
  cid  references classes(id)\
);" \
"create table classes(id integer primary key);" \
".headers on" \
"select * from pragma_table_info('users');"

sqlite3 :memory: \
"create table users(\
  id   integer primary key,\
  name text    unique not null,\
  age  integer default 0 check(0<=age),\
  cid  references classes(id)\
);" \
"create table classes(id integer primary key);" \
".headers on" \
"pragma table_xinfo(users);"
sqlite3 :memory: \
"create table users(\
  id   integer primary key,\
  name text    unique not null,\
  age  integer default 0 check(0<=age),\
  cid  references classes(id)\
);" \
"create table classes(id integer primary key);" \
".headers on" \
"select * from pragma_table_xinfo('users');"

sqlite3 :memory: "pragma temp_store;"

sqlite3 :memory: "pragma temp_store_directory;"

sqlite3 :memory: "pragma threads;"

sqlite3 :memory: "pragma user_version;"

sqlite3 :memory: "pragma wal_autocheckpoint;"

sqlite3 :memory: ".headers on" "pragma wal_checkpoint;"
sqlite3 :memory: ".headers on" "select * from pragma_wal_checkpoint;"

sqlite3 :memory: "pragma writable_schema;"
sqlite3 :memory: "pragma writable_schema=1;" "pragma writable_schema;"

