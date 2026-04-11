/// Module for [SqlParser] class
module gda.sql_parser;

import gda.batch;
import gda.c.functions;
import gda.c.types;
import gda.lockable;
import gda.lockable_mixin;
import gda.statement;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.gid_builder;
import gobject.object;

/** */
class SqlParser : gobject.object.ObjectWrap, gda.lockable.Lockable
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_sql_parser_get_type != &gidSymbolNotFound ? gda_sql_parser_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SqlParser self()
  {
    return this;
  }

  /**
      Get builder for [gda.sql_parser.SqlParser]
      Returns: New builder object
  */
  static SqlParserGidBuilder builder()
  {
    return new SqlParserGidBuilder;
  }

  /** */
  @property int columnError()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("column-error");
  }

  /** */
  @property int lineError()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("line-error");
  }

  /** */
  @property int mode()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("mode");
  }

  /** */
  @property void mode(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("mode", propval);
  }

  /** */
  @property int tokenizerFlavour()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("tokenizer-flavour");
  }

  /** */
  @property void tokenizerFlavour(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("tokenizer-flavour", propval);
  }

  mixin LockableT!();

  /**
      Creates a new #GdaSqlParser object
      Returns: the new object
  */
  this()
  {
    GdaSqlParser* _cretval;
    _cretval = gda_sql_parser_new();
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_sql_parser_error_quark();
    return _retval;
  }

  /**
      Parse filename's contents and creates a #GdaBatch object which contains all the
       #GdaStatement objects created while parsing (one object per SQL statement).
      
      filename's contents are parsed and #GdaStatement objects are created as long as no error is found. If an error is found
      at some point, then the parsing stops, error may be set and null is returned
      
      if sql is null, then the returned #GdaBatch object will contain no statement.
  
      Params:
        filename = name of the file to parse
      Returns: a new #GdaBatch object, or null if an error occurred
      Throws: [SqlParserException]
  */
  gda.batch.Batch parseFileAsBatch(string filename)
  {
    GdaBatch* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _cretval = gda_sql_parser_parse_file_as_batch(cast(GdaSqlParser*)this._cPtr, _filename, &_err);
    if (_err)
      throw new SqlParserException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.batch.Batch)(cast(GdaBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Parses sql and creates a #GdaStatement statement from the first SQL statement contained in sql: if sql
      contains more than one statement, then the remaining part of the string is not parsed at all, and remain (if
      not null) will point at the first non parsed character.
      
      To include variables in the sql string, see the
      <link linkend="GdaSqlParser.description">GdaSqlParser's object description</link>.
  
      Params:
        sql = the SQL string to parse
        remain = location to store a pointer to remaining part of sql in case sql has multiple statement, or null
      Returns: a new #GdaStatement object, or null if an error occurred
      Throws: [SqlParserException]
  */
  gda.statement.Statement parseString(string sql, out string remain)
  {
    GdaStatement* _cretval;
    const(char)* _sql = sql.toCString(No.Alloc);
    char* _remain;
    GError *_err;
    _cretval = gda_sql_parser_parse_string(cast(GdaSqlParser*)this._cPtr, _sql, &_remain, &_err);
    if (_err)
      throw new SqlParserException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.statement.Statement)(cast(GdaStatement*)_cretval, Yes.Take);
    remain = _remain.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parse sql and creates a #GdaBatch object which contains all the #GdaStatement objects created while parsing (one object
      per SQL statement). Empty statements (composed of spaces only) do not appear in the resulting object.
      
      sql is parsed and #GdaStatement objects are created as long as no error is found in sql. If an error is found
      at some point, then the parsing stops and remain may contain a non null pointer, error may be set, and null
      is returned.
      
      if sql is null, then the returned #GdaBatch object will contain no statement.
      
      To include variables in the sql string, see the
      <link linkend="GdaSqlParser.description">GdaSqlParser's object description</link>.
  
      Params:
        sql = the SQL string to parse
        remain = location to store a pointer to remaining part of sql in case an error occurred while parsing sql, or null
      Returns: a new #GdaBatch object, or null if an error occurred
      Throws: [SqlParserException]
  */
  gda.batch.Batch parseStringAsBatch(string sql, out string remain)
  {
    GdaBatch* _cretval;
    const(char)* _sql = sql.toCString(No.Alloc);
    char* _remain;
    GError *_err;
    _cretval = gda_sql_parser_parse_string_as_batch(cast(GdaSqlParser*)this._cPtr, _sql, &_remain, &_err);
    if (_err)
      throw new SqlParserException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.batch.Batch)(cast(GdaBatch*)_cretval, Yes.Take);
    remain = _remain.fromCString(Yes.Free);
    return _retval;
  }

  /** */
  void setOverflowError()
  {
    gda_sql_parser_set_overflow_error(cast(GdaSqlParser*)this._cPtr);
  }

  /** */
  void setSyntaxError()
  {
    gda_sql_parser_set_syntax_error(cast(GdaSqlParser*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gda.sql_parser.SqlParser]
class SqlParserGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gda.lockable.LockableGidBuilderImpl!T
{

  mixin LockableGidBuilderT!();

  /** */
  T mode(int propval)
  {
    return setProperty("mode", propval);
  }

  /** */
  T tokenizerFlavour(int propval)
  {
    return setProperty("tokenizer-flavour", propval);
  }
}

/// Fluent builder for [gda.sql_parser.SqlParser]
final class SqlParserGidBuilder : SqlParserGidBuilderImpl!SqlParserGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SqlParser build()
  {
    return new SqlParser(cast(void*)createGObject(SqlParser._getGType), Yes.Take);
  }
}

class SqlParserException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.sql_parser.SqlParser.errorQuark, cast(int)code, msg);
  }

  alias Code = SqlParserError;
}
