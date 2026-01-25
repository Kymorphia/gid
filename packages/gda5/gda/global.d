/// Global functions for gda5 library
module gda.global;

import gda.binary;
import gda.blob;
import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.data_model;
import gda.data_select;
import gda.holder;
import gda.server_provider;
import gda.set;
import gda.statement;
import gda.time;
import gda.timestamp;
import gda.types;
import gid.gid;
import glib.date;
import glib.error;
import glib.types;
import gobject.object;
import gobject.types;
import gobject.value;
import libxml2.types;


/**
    Escapes string to make it understandable by a DBMS. The escape method is very common and replaces any
    occurrence of "'" with "''" and "\" with "\\"

    Params:
      string_ = string to escape
    Returns: a new string
*/
string escapeString(string string_)
{
  char* _cretval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _cretval = gda_default_escape_string(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Do the reverse of [gda.global.defaultEscapeString]: transforms any "''" into "'", any
    "\\" into "\" and any "\'" into "'".

    Params:
      string_ = string to unescape
    Returns: a new unescaped string, or null in an error was found in string
*/
string unescapeString(string string_)
{
  char* _cretval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _cretval = gda_default_unescape_string(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Does the opposite of [gda.global.textToAlphanum], in the same string

    Params:
      text = a string
    Returns: text if conversion succeeded or null if an error occurred
*/
string alphanumToText(string text)
{
  char* _cretval;
  char* _text = text.toCString(No.Alloc);
  _cretval = gda_alphanum_to_text(_text);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Creates an array of strings (terminated by a null) corresponding to possible completions.
    If no completion is available, then the returned array contains just one NULL entry, and
    if it was not possible to try to compute a completions list, then null is returned.

    Params:
      cnc = a #GdaConnection object
      sql = a partial SQL statement which is the context of the completion proposal
      start = starting position within sql of the "token" to complete (starts at 0)
      end = ending position within sql of the "token" to complete
    Returns: a new array of strings, or null (use [glib.global.strfreev] to free the returned array)
*/
string[] completionListGet(gda.connection.Connection cnc, string sql, int start, int end)
{
  char** _cretval;
  const(char)* _sql = sql.toCString(No.Alloc);
  _cretval = gda_completion_list_get(cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, _sql, start, end);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Creates an INSERT, an UPDATE and a DELETE statement from a SELECT statement
    using the database metadata available in cnc's meta store. Each statements are computed only if
    the corresponding place to store the created statement is not null.

    Params:
      cnc = a #GdaConnection
      selectStmt = a SELECT #GdaStatement (compound statements not handled)
      requirePk = TRUE if the created statement have to use a primary key
      insertStmt = a place to store the created INSERT statement, or null
      updateStmt = a place to store the created UPDATE statement, or null
      deleteStmt = a place to store the created DELETE statement, or null
    Returns: true if no error occurred
    Throws: [ErrorWrap]
*/
bool computeDmlStatements(gda.connection.Connection cnc, gda.statement.Statement selectStmt, bool requirePk, gda.statement.Statement insertStmt = null, gda.statement.Statement updateStmt = null, gda.statement.Statement deleteStmt = null)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)gda_compute_dml_statements(cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, selectStmt ? cast(GdaStatement*)selectStmt._cPtr(No.Dup) : null, requirePk, insertStmt ? cast(GdaStatement**)insertStmt._cPtr(Yes.Dup) : null, updateStmt ? cast(GdaStatement**)updateStmt._cPtr(Yes.Dup) : null, deleteStmt ? cast(GdaStatement**)deleteStmt._cPtr(Yes.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Extract the DSN, username and password from string. in string, the various parts are strings
    which are expected to be encoded using an RFC 1738 compliant encoding. If they are specified,
    the returned username and password strings are correctly decoded.
    
    out_username and out_password may be set to null depending on string's format.

    Params:
      string_ = a string in the "[&lt;username&gt;[:&lt;password&gt;]@]&lt;DSN&gt;" form
      outDsn = a place to store the new string containing the &lt;DSN&gt; part
      outUsername = a place to store the new string containing the &lt;username&gt; part
      outPassword = a place to store the new string containing the &lt;password&gt; part
*/
void dsnSplit(string string_, out string outDsn, out string outUsername, out string outPassword)
{
  const(char)* _string_ = string_.toCString(No.Alloc);
  char* _outDsn;
  char* _outUsername;
  char* _outPassword;
  gda_dsn_split(_string_, &_outDsn, &_outUsername, &_outPassword);
  outDsn = _outDsn.fromCString(No.Free);
  outUsername = _outUsername.fromCString(No.Free);
  outPassword = _outPassword.fromCString(No.Free);
}

/**
    Converts a named type to ts GType type (also see the [gda.global.gTypeToString] function).
    
    This function is a wrapper around the [gobject.global.typeFromName] function, but also recognizes
    some type synonyms such as:
    <itemizedlist>
      <listitem><para>"int" for G_TYPE_INT</para></listitem>
      <listitem><para>"uint" for G_TYPE_UINT</para></listitem>
      <listitem><para>"int64" for G_TYPE_INT64</para></listitem>
      <listitem><para>"uint64" for G_TYPE_UINT64</para></listitem>
      <listitem><para>"char" for G_TYPE_CHAR</para></listitem>
      <listitem><para>"uchar" for G_TYPE_UCHAR</para></listitem>
      <listitem><para>"short" for GDA_TYPE_SHORT</para></listitem>
      <listitem><para>"ushort" for GDA_TYPE_USHORT</para></listitem>
      <listitem><para>"string" for G_TYPE_STRING</para></listitem>
      <listitem><para>"date" for G_TYPE_DATE</para></listitem>
      <listitem><para>"time" for GDA_TYPE_TIME</para></listitem>
      <listitem><para>"timestamp" for GDA_TYPE_TIMESTAMP</para></listitem>
      <listitem><para>"boolean" for G_TYPE_BOOLEAN</para></listitem>
      <listitem><para>"blob" for GDA_TYPE_BLOB</para></listitem>
      <listitem><para>"binary" for GDA_TYPE_BINARY</para></listitem>
      <listitem><para>"null" for GDA_TYPE_NULL</para></listitem>
    </itemizedlist>

    Params:
      str = the name of a #GType, as returned by [gda.global.gTypeToString].
    Returns: the #GType represented by the given str, or #G_TYPE_INVALID if not found
*/
gobject.types.GType gTypeFromString(string str)
{
  gobject.types.GType _retval;
  const(char)* _str = str.toCString(No.Alloc);
  _retval = gda_g_type_from_string(_str);
  return _retval;
}

/**
    Converts a GType to its string representation (use [gda.global.gTypeFromString] for the
    operation in the other direction).
    
    This function wraps [gobject.global.typeName] but for common types it provides an easier to
    understand and remember name. For Example the G_TYPE_STRING is converted to "string"
    whereas [gobject.global.typeName] converts it to "gchararray".

    Params:
      type = Type to convert from.
    Returns: the GDA's string representing the given #GType or the name
      returned by #g_type_name.
*/
string gTypeToString(gobject.types.GType type)
{
  const(char)* _cretval;
  _cretval = gda_g_type_to_string(type);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Find the path to the application identified by app_name. For example if the application
    is "gda-sql", then calling this function will return
    "/your/prefix/bin/gda-sql-5.0" if Libgda is installed in
    the "/your/prefix" prefix (which would usually be "/usr"), and for the ABI version 5.0.

    Params:
      appName = the name of the application to find
    Returns: the path as a new string, or null if the application cannot be found
*/
string getApplicationExecPath(string appName)
{
  char* _cretval;
  const(char)* _appName = appName.toCString(No.Alloc);
  _cretval = gda_get_application_exec_path(_appName);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Does the same as strcmp(id1, id2), but handles the case where id1 and/or id2 are enclosed in double quotes.
    can also be used in hash tables as a #GEqualFunc.

    Params:
      id1 = an identifier string
      id2 = an identifier string
    Returns: true if id1 and id2 are equal.
*/
bool identifierEqual(string id1, string id2)
{
  bool _retval;
  const(char)* _id1 = id1.toCString(No.Alloc);
  const(char)* _id2 = id2.toCString(No.Alloc);
  _retval = cast(bool)gda_identifier_equal(_id1, _id2);
  return _retval;
}

/**
    computes a hash string from id, to be used in hash tables as a #GHashFunc

    Params:
      id = an identifier string
    Returns: a new hash
*/
uint identifierHash(string id)
{
  uint _retval;
  const(char)* _id = id.toCString(No.Alloc);
  _retval = gda_identifier_hash(_id);
  return _retval;
}

/**
    Initializes the GDA library, must be called prior to any Libgda usage.
    
    Please note that if you call setlocale() to modify the current locale, you should also
    call [gda.global.localeChanged] before using Libgda again.
*/
void init_()
{
  gda_init();
}

/**
    Call this function whenever the setlocale() function has been called
    to change the current locale; this function is first called by [gda.global.init_] so you
    don't need to call it if you have set the locale before calling [gda.global.init_].
    
    Failing to call this function after having changed the current locale may result
    in Libgda reverting to the previous set locale.
*/
void localeChanged()
{
  gda_locale_changed();
}

/**
    Disables GDA logs.
*/
void logDisable()
{
  gda_log_disable();
}

/**
    Enables GDA logs.
*/
void logEnable()
{
  gda_log_enable();
}

/** */
bool logIsEnabled()
{
  bool _retval;
  _retval = cast(bool)gda_log_is_enabled();
  return _retval;
}

/**
    This function is similar to [gda.global.parseIso8601Date] (with first being G_DATE_YEAR, second being G_DATE_MONTH,
    third being G_DATE_DAY and sep being '-') but allows one to specify the expected date format.

    Params:
      gdate = a pointer to a #GDate structure which will be filled
      value = a string to be parsed
      first = a #GDateDMY specifying which of year, month or day appears first (in the first bytes) in value
      second = a #GDateDMY specifying which of year, month or day appears second (in the first bytes) in value
      third = a #GDateDMY specifying which of year, month or day appears third (in the first bytes) in value
      sep = spcifies the expected separator character bewteen year, month and day (for example '-')
    Returns: true if value has been sucessfuly parsed as a valid date (see [glib.date.Date.valid]).
*/
bool parseFormattedDate(glib.date.Date gdate, string value, glib.types.DateDMY first, glib.types.DateDMY second, glib.types.DateDMY third, char sep)
{
  bool _retval;
  const(char)* _value = value.toCString(No.Alloc);
  _retval = cast(bool)gda_parse_formatted_date(cast(GDate*)&gdate, _value, first, second, third, sep);
  return _retval;
}

/** */
bool parseFormattedTime(gda.time.Time timegda, string value, char sep)
{
  bool _retval;
  const(char)* _value = value.toCString(No.Alloc);
  _retval = cast(bool)gda_parse_formatted_time(cast(GdaTime*)&timegda, _value, sep);
  return _retval;
}

/**
    This function is similar to [gda.global.parseIso8601Timestamp] (with first being G_DATE_YEAR, second being G_DATE_MONTH,
    third being G_DATE_DAY and sep being '-') but allows one to specify the expected date format.

    Params:
      timestamp = a pointer to a #GdaTimeStamp structure which will be filled
      value = a string to be parsed
      first = a #GDateDMY specifying which of year, month or day appears first (in the first bytes) in value
      second = a #GDateDMY specifying which of year, month or day appears second (in the first bytes) in value
      third = a #GDateDMY specifying which of year, month or day appears third (in the first bytes) in value
      sep = spcifies the expected separator character bewteen year, month and day (for example '-')
    Returns: true if value has been sucessfuly parsed as a valid date (see [glib.date.Date.valid]).
*/
bool parseFormattedTimestamp(gda.timestamp.Timestamp timestamp, string value, glib.types.DateDMY first, glib.types.DateDMY second, glib.types.DateDMY third, char sep)
{
  bool _retval;
  const(char)* _value = value.toCString(No.Alloc);
  _retval = cast(bool)gda_parse_formatted_timestamp(cast(GdaTimestamp*)&timestamp, _value, first, second, third, sep);
  return _retval;
}

/**
    Extracts date parts from value, and sets gdate's contents
    
    Accepted date format is "YYYY-MM-DD" (more or less than 4 digits for years and
    less than 2 digits for month and day are accepted). Years must be in the 1-65535 range,
    a limitation imposed by #GDate.

    Params:
      gdate = a pointer to a #GDate structure which will be filled
      value = a string
    Returns: true if value has been sucessfuly parsed as a valid date (see [glib.date.Date.valid]).
*/
bool parseIso8601Date(glib.date.Date gdate, string value)
{
  bool _retval;
  const(char)* _value = value.toCString(No.Alloc);
  _retval = cast(bool)gda_parse_iso8601_date(cast(GDate*)&gdate, _value);
  return _retval;
}

/**
    Extracts time parts from value, and sets timegda's contents
    
    Accepted date format is "HH:MM:SS[.ms][TZ]" where TZ is +hour or -hour

    Params:
      timegda = a pointer to a #GdaTime structure which will be filled
      value = a string
    Returns: true if no error occurred
*/
bool parseIso8601Time(gda.time.Time timegda, string value)
{
  bool _retval;
  const(char)* _value = value.toCString(No.Alloc);
  _retval = cast(bool)gda_parse_iso8601_time(cast(GdaTime*)&timegda, _value);
  return _retval;
}

/**
    Extracts date and time parts from value, and sets timestamp's contents
    
    Accepted date format is "YYYY-MM-DD HH:MM:SS[.ms][TZ]" where TZ is +hour or -hour

    Params:
      timestamp = a pointer to a #GdaTimeStamp structure which will be filled
      value = a string
    Returns: true if value has been sucessfuly parsed as a valid timestamp (see [glib.date.Date.valid])
*/
bool parseIso8601Timestamp(gda.timestamp.Timestamp timestamp, string value)
{
  bool _retval;
  const(char)* _value = value.toCString(No.Alloc);
  _retval = cast(bool)gda_parse_iso8601_timestamp(cast(GdaTimestamp*)&timestamp, _value);
  return _retval;
}

/**
    Modifies stmt to take into account any parameter which might be null: if stmt contains the
    equivalent of "xxx = &lt;parameter definition&gt;" and if that parameter is in params and
    its value is of type GDA_TYPE_NUL, then that part is replaced with "xxx IS NULL". It also
    handles the "xxx IS NOT NULL" transformation.
    
    For example the following SELECT:
    <programlisting>SELECT * FROM data WHERE id = ##id::int::null AND name = ##name::string</programlisting>
    in case the "id" parameter is set to NULL, is converted to:
    <programlisting>SELECT * FROM data WHERE id IS NULL AND name = ##name::string</programlisting>
    
    if out_stmt is not null, then it will contain:
    <itemizedlist>
      <listitem><para>the modified statement if some modifications were required and no error occured (the function returns true)</para></listitem>
      <listitem><para>null if no modification to stmt were required and no erro occurred (the function returns false)</para></listitem>
      <listitem><para>null if an error occured (the function returns true)</para></listitem>
    </itemizedlist>
    
    This function is used by provider's implementations to make sure one can use parameters with
    NULL values in statements without having to rewrite statements, as database usually don't
    consider that "xxx = NULL" is the same as "xxx IS NULL" when using parameters.

    Params:
      stmt = a #GdaStatement
      params = a #GdaSet to be used as parameters when executing stmt
      outStmt = a place to store the new #GdaStatement, or null
    Returns: true if stmt needs to be transformed to handle NULL parameters, and false otherwise
    Throws: [ErrorWrap]
*/
bool rewriteStatementForNullParameters(gda.statement.Statement stmt, gda.set.Set params, gda.statement.Statement outStmt = null)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)gda_rewrite_statement_for_null_parameters(stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null, params ? cast(GdaSet*)params._cPtr(No.Dup) : null, outStmt ? cast(GdaStatement**)outStmt._cPtr(Yes.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Decodes string using the RFC 1738 recommendations: the
    <constant>&lt;&gt;&quot;#%{}|\^~[]&apos;`;/?:@=&amp;</constant> and space characters are replaced by
    <constant>&quot;%`ab`&quot;</constant> where
    <constant>ab</constant> is the hexadecimal number corresponding to the character.
    
    string should respect the RFC 1738 encoding. If this is not the case (for example if there
    is a "`2z`" because 2z is not an hexadecimal value), then the part with the problem
    is not decoded, and the function returns FALSE.
    
    string is decoded in place, no new string gets created.

    Params:
      string_ = a string to decode
    Returns: true if no error occurred.
*/
bool rfc1738Decode(string string_)
{
  bool _retval;
  char* _string_ = string_.toCString(No.Alloc);
  _retval = cast(bool)gda_rfc1738_decode(_string_);
  return _retval;
}

/**
    Encodes string using the RFC 1738 recommendations: the
    <constant>&lt;&gt;&quot;#%{}|\^~[]&apos;`;/?:@=&amp;</constant> and space characters are replaced by
    <constant>&quot;%`ab`&quot;</constant> where
    <constant>ab</constant> is the hexadecimal number corresponding to the character.

    Params:
      string_ = a string to encode
    Returns: a new string
*/
string rfc1738Encode(string string_)
{
  char* _cretval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _cretval = gda_rfc1738_encode(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Creates a new #GdaStatement, selecting the same data as stmt, but which always returns an
    empty (no row) data model. This is use dy database providers' implementations.

    Params:
      stmt = a SELECT #GdaStatement
    Returns: a new #GdaStatement
    Throws: [ErrorWrap]
*/
gda.statement.Statement selectAlterSelectForEmpty(gda.statement.Statement stmt)
{
  GdaStatement* _cretval;
  GError *_err;
  _cretval = gda_select_alter_select_for_empty(stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gda.statement.Statement)(cast(GdaStatement*)_cretval, Yes.Take);
  return _retval;
}

/** */
glib.types.Quark sqlErrorQuark()
{
  glib.types.Quark _retval;
  _retval = gda_sql_error_quark();
  return _retval;
}

/**
    Add double quotes around the str identifier. This function is normally used only by database provider's
    implementation. Any double quote character is replaced by two double quote characters.
    
    For other uses, see [gda.global.sqlIdentifierQuote].

    Params:
      str = an SQL identifier
    Returns: 
*/
string sqlIdentifierForceQuotes(string str)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = gda_sql_identifier_force_quotes(_str);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Prepares str to be compared:
    <itemizedlist>
    <listitem><para>if surrounded by double quotes or single quotes, then just remove the quotes</para></listitem>
    <listitem><para>otherwise convert to lower case</para></listitem>
    </itemizedlist>
    
    The quoted string:
    <itemizedlist>
      <listitem><para>must start and finish with the same single or double quotes character</para></listitem>
      <listitem><para>can contain the delimiter character (the single or double quotes) in the string if every instance
        of it is preceeded with a backslash character or with the delimiter character itself</para></listitem>
    </itemizedlist>
    
    This function is normally used only by database provider's implementation.
    
    WARNING: str must NOT be a composed identifier (&lt;part1&gt;."&lt;part2&gt;" for example)

    Params:
      str = a quoted string
    Returns: str
*/
string sqlIdentifierPrepareForCompare(string str)
{
  char* _cretval;
  char* _str = str.toCString(No.Alloc);
  _cretval = gda_sql_identifier_prepare_for_compare(_str);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Use this function for any SQL identifier to make sure that:
    <itemizedlist>
      <listitem>
        <para>it is correctly formatted
              to be used with cnc (if cnc is null, then some default SQL quoting rules will be applied,
              similar to PostgreSQL's way) if for_meta_store is false;
        </para>
      </listitem>
      <listitem>
        <para>it is correctly formatted to be used with the #GdaMetaStore's object associated to cnc
              is for_meta_store is true.
        </para>
      </listitem>
    </itemizedlist>
    
    The force_quotes allow some control of how to interpret id: if false, then id will be left
    unchanged most of the time (except for example if it's a reserved keyword), otherwise
    if force_quotes is true, then the returned string will most probably have quotes around it
    to request that the database keep the case sensitiveness (but again, this may vary depending
    on the database being accessed through cnc).
    
    For example, the following table gives the result of this function depending on the arguments
    when cnc is null (and prov is also null):
    <table frame="all">
     <tgroup cols="6" colsep="1" rowsep="1" align="justify">
       <thead>
         <row>
           <entry>id</entry>
           <entry>for_meta_store=false, force_quotes=false</entry>
           <entry>for_meta_store=true, force_quotes=false</entry>
           <entry>for_meta_store=false, force_quotes=true</entry>
           <entry>for_meta_store=true, force_quotes=true</entry>
           <entry>remark</entry>
         </row>
       </thead>
       <tbody>
         <row>
           <entry>"double word"</entry>
           <entry>"double word"</entry>
           <entry>"double word"</entry>
           <entry>"double word"</entry>
           <entry>"double word"</entry>
           <entry>non allowed character in SQL identifier</entry>
         </row>
         <row>
           <entry>"CapitalTest"</entry>
           <entry>"CapitalTest"</entry>
           <entry>"CapitalTest"</entry>
           <entry>"CapitalTest"</entry>
           <entry>"CapitalTest"</entry>
           <entry>Mixed case SQL identifier, already quoted</entry>
         </row>
         <row>
           <entry>CapitalTest</entry>
           <entry>CapitalTest</entry>
           <entry>capitaltest</entry>
           <entry>"CapitalTest"</entry>
           <entry>"CapitalTest"</entry>
           <entry>Mixed case SQL identifier, non quoted</entry>
         </row>
         <row>
           <entry>"mytable"</entry>
           <entry>"mytable"</entry>
           <entry>mytable</entry>
           <entry>"mytable"</entry>
           <entry>mytable</entry>
           <entry>All lowser case, quoted</entry>
         </row>
         <row>
           <entry>mytable</entry>
           <entry>mytable</entry>
           <entry>mytable</entry>
           <entry>"mytable"</entry>
           <entry>mytable</entry>
           <entry>All lowser case</entry>
         </row>
         <row>
           <entry>MYTABLE</entry>
           <entry>MYTABLE</entry>
           <entry>mytable</entry>
           <entry>"MYTABLE"</entry>
           <entry>"MYTABLE"</entry>
           <entry>All upper case</entry>
         </row>
         <row>
           <entry>"MYTABLE"</entry>
           <entry>"MYTABLE"</entry>
           <entry>"MYTABLE"</entry>
           <entry>"MYTABLE"</entry>
           <entry>"MYTABLE"</entry>
           <entry>All upper case, quoted</entry>
         </row>
         <row>
           <entry>desc</entry>
           <entry>"desc"</entry>
           <entry>"desc"</entry>
           <entry>"desc"</entry>
           <entry>"desc"</entry>
           <entry>SQL reserved keyword</entry>
         </row>
         <row>
           <entry>5ive</entry>
           <entry>"5ive"</entry>
           <entry>"5ive"</entry>
           <entry>"5ive"</entry>
           <entry>"5ive"</entry>
           <entry>SQL identifier starting with a digit</entry>
         </row>
       </tbody>
     </tgroup>
    </table>
    
    Here are a few examples of when and how to use this function:
    <itemizedlist>
      <listitem>
        <para>
          When creating a table, the user has entered the table name, this function can be used to
          create a valid SQL identifier from the user provided table name:
          <programlisting>
    gchar *user_sqlid=...
    gchar *valid_sqlid = gda_sql_identifier_quote (user_sqlid, cnc, NULL, FALSE, FALSE);
    gchar *sql = g_strdup_printf ("CREATE TABLE `s` ...", valid_sqlid);
    g_free (valid_sqlid);
          </programlisting>
          Note that this is an illustration and creating a table should be sone using a #GdaServerOperation
          object.
        </para>
      </listitem>
      <listitem>
        <para>
         When updating the meta data associated to a table which has been created with the code
         above:
         <programlisting>
    GValue table_name_value = { 0 };
    gchar* column_names[] = { (gchar*)"table_name" };
    GValue* column_values[] = { &table_name_value };
    GdaMetaContext mcontext = { (gchar*)"_tables", 1, column_names, column_values };
    g_value_init (&amp;table_name_value, G_TYPE_STRING);
    g_value_take_string (&amp;table_name_value, gda_sql_identifier_quote (user_sqlid, cnc, NULL, TRUE, FALSE);
    gda_connection_update_meta_store (cnc, &amp;mcontext, NULL);
    g_value_reset (&amp;table_name_value);
          </programlisting>
        </para>
      </listitem>
      <listitem>
        <para>
         When using a #GdaMetaStruct object to fetch information about a table (which has been created with
         the code above):
         <programlisting>
    GValue table_name_value = { 0 };
    g_value_init (&amp;table_name_value, G_TYPE_STRING);
    g_value_take_string (&amp;table_name_value, gda_sql_identifier_quote (user_sqlid, cnc, NULL, TRUE, FALSE);
    GdaMetaDbObject *dbo;
    dbo = gda_meta_struct_complement (mstruct, GDA_META_DB_TABLE, NULL, NULL, &amp;table_name_value, NULL);
    g_value_reset (&amp;table_name_value);
          </programlisting>
        </para>
      </listitem>
    </itemizedlist>
    
    
    Note that id must not be a composed SQL identifier (such as "mytable.mycolumn" which should be
    treated as the "mytable" and "mycolumn" SQL identifiers). If unsure, use [gda.global.sqlIdentifierSplit].
    
    Also note that if cnc is null, then it's possible to pass an non null prov to have a result specific
    to prov.
    
    For more information, see the <link linkend="gen:sql_identifiers">SQL identifiers and abstraction</link> and
    <link linkend="information_schema:sql_identifiers">SQL identifiers in meta data</link> sections.

    Params:
      id = an SQL identifier
      cnc = a #GdaConnection object, or null
      prov = a #GdaServerProvider object, or null
        for_meta_store set to true if the returned string will be used in a #GdaMetaStore
      metaStoreConvention = 
      forceQuotes = set to true to force the returned string to be quoted
    Returns: the representation of id ready to be used in SQL statement, as a new string,
               or null if id is in a wrong format
*/
string sqlIdentifierQuote(string id, gda.connection.Connection cnc, gda.server_provider.ServerProvider prov, bool metaStoreConvention, bool forceQuotes)
{
  char* _cretval;
  const(char)* _id = id.toCString(No.Alloc);
  _cretval = gda_sql_identifier_quote(_id, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, prov ? cast(GdaServerProvider*)prov._cPtr(No.Dup) : null, metaStoreConvention, forceQuotes);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Splits id into an array of it sub parts. id's format has to be "&lt;part&gt;[.&lt;part&gt;[...]]" where
    each part is either a text surrounded by double quotes which can contain upper and lower cases or
    an SQL identifier in lower case.
    
    For example the <![CDATA["test.\"ATable\""]]> string will result in the array: <![CDATA[{"test", "\"ATable\"", NULL}]]>

    Params:
      id = an SQL identifier
    Returns: a new null-terminated array of strings, or NULL (use [glib.global.strfreev] to free the returned array)
*/
string[] sqlIdentifierSplit(string id)
{
  char** _cretval;
  const(char)* _id = id.toCString(No.Alloc);
  _cretval = gda_sql_identifier_split(_id);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Simplified version of [gda.global.valueStringify].

    Params:
      value = a #GValue pointer
    Returns: a new string
*/
string sqlValueStringify(gobject.value.Value value)
{
  char* _cretval;
  _cretval = gda_sql_value_stringify(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Performs the reverse of [gda.binary.Binary.toString_] (note that for any "\xyz" succession
    of 4 characters where "xyz" represents a valid octal value, the resulting read value will
    be modulo 256).
    
    I str is null, then an empty (i.e. where the data part is null) #GdaBinary is created and returned.

    Params:
      str = a string to convert, or null
    Returns: a new #GdaBinary if no error were found in str, or null otherwise
*/
gda.binary.Binary stringToBinary(string str = null)
{
  GdaBinary* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = gda_string_to_binary(_str);
  auto _retval = _cretval ? new gda.binary.Binary(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Performs the reverse of [gda.blob.Blob.toString_].

    Params:
      str = a string to convert
    Returns: a new #gdaBlob if no error were found in str, or NULL otherwise
*/
gda.blob.Blob stringToBlob(string str)
{
  GdaBlob* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = gda_string_to_blob(_str);
  auto _retval = _cretval ? new gda.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    The "encoding" consists in replacing non
    alphanumeric character with the string "__gdaXX" where XX is the hex. representation
    of the non alphanumeric char.

    Params:
      text = the text to convert
    Returns: a new string
*/
string textToAlphanum(string text)
{
  char* _cretval;
  const(char)* _text = text.toCString(No.Alloc);
  _cretval = gda_text_to_alphanum(_text);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Check the column types of a GdaDataModel.

    Params:
      model = a #GdaDataModel object
      types = array with nbcols length of type GType or null (if any data type is accepted)
    Returns: true if the data model's columns match the provided data types and number
*/
bool utilityCheckDataModel(gda.data_model.DataModel model, gobject.types.GType[] types)
{
  bool _retval;
  int _nbcols;
  if (types)
    _nbcols = cast(int)types.length;

  auto _types = cast(GType*)types.ptr;
  _retval = cast(bool)gda_utility_check_data_model_v(model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null, _nbcols, _types);
  return _retval;
}

/**
    Dump the data in a #GdaDataModel into a xmlNodePtr (as used in libxml).
    
    Warning: this function uses a #GdaDataModelIter iterator, and if model does not offer a random access
    (check using [gda.data_model.DataModel.getAccessFlags]), the iterator will be the same as normally used
    to access data in model previously to calling this method, and this iterator will be moved (point to
    another row).

    Params:
      model = a #GdaDataModel
      parent = the parent XML node
      cols = an array containing which columns of model will be exported, or null for all columns
      rows = an array containing which rows of model will be exported, or null for all rows
      useColIds = set to true to add column ID information
    Returns: true if no error occurred
*/
bool utilityDataModelDumpDataToXml(gda.data_model.DataModel model, libxml2.types.NodePtr parent, int[] cols, int[] rows, bool useColIds)
{
  bool _retval;
  int _nbCols;
  if (cols)
    _nbCols = cast(int)cols.length;

  auto _cols = cast(const(int)*)cols.ptr;
  int _nbRows;
  if (rows)
    _nbRows = cast(int)rows.length;

  auto _rows = cast(const(int)*)rows.ptr;
  _retval = cast(bool)gda_utility_data_model_dump_data_to_xml(model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null, parent, _cols, _nbCols, _rows, _nbRows, useColIds);
  return _retval;
}

/**
    Finds the description of a field into Metadata from a #GdaDataModel.

    Params:
      model = a #GdaDataSelect data model
      fieldName = field name
    Returns: The field's description, or NULL if description is not set
*/
string utilityDataModelFindColumnDescription(gda.data_select.DataSelect model, string fieldName)
{
  const(char)* _cretval;
  const(char)* _fieldName = fieldName.toCString(No.Alloc);
  _cretval = gda_utility_data_model_find_column_description(model ? cast(GdaDataSelect*)model._cPtr(No.Dup) : null, _fieldName);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Note: this method may set the "source" custom string property

    Params:
      holder = a #GdaHolder
      node = an xmlNodePtr with a &lt;parameter&gt; tag
      sources = a list of #GdaDataModel
    Returns: true if no error occurred
    Throws: [ErrorWrap]
*/
bool utilityHolderLoadAttributes(gda.holder.Holder holder, libxml2.types.NodePtr node, gda.data_model.DataModel[] sources)
{
  bool _retval;
  auto _sources = gSListFromD!(gda.data_model.DataModel)(sources);
  scope(exit) containerFree!(GSList*, gda.data_model.DataModel, GidOwnership.None)(_sources);
  GError *_err;
  _retval = cast(bool)gda_utility_holder_load_attributes(holder ? cast(GdaHolder*)holder._cPtr(No.Dup) : null, node, _sources, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Compares two values of the same type, with the exception that a value of any type can be
    compared to a GDA_TYPE_NULL value, specifically:
    <itemizedlist>
      <listitem><para>if value1 and value2 are both GDA_TYPE_NULL values then the returned value is 0</para></listitem>
      <listitem><para>if value1 is a GDA_TYPE_NULL value and value2 is of another type then the returned value is -1</para></listitem>
      <listitem><para>if value1 is of another type and value2 is a GDA_TYPE_NULL value then the returned value is 1</para></listitem>
      <listitem><para>in all other cases, value1 and value2 must be of the same type and their values are compared</para></listitem>
    </itemizedlist>

    Params:
      value1 = a #GValue to compare (not null)
      value2 = the other #GValue to be compared to value1 (not null)
    Returns: if both values have the same type, returns 0 if both contain
      the same value, an integer less than 0 if value1 is less than value2 or
      an integer greater than 0 if value1 is greater than value2.
*/
int valueCompare(gobject.value.Value value1, gobject.value.Value value2)
{
  int _retval;
  _retval = gda_value_compare(value1 ? cast(const(GValue)*)value1._cPtr(No.Dup) : null, value2 ? cast(const(GValue)*)value2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tells if two values are equal or not, by comparing memory representations. Unlike [gda.global.valueCompare],
    the returned value is boolean, and gives no idea about ordering.
    
    The two values must be of the same type, with the exception that a value of any type can be
    compared to a GDA_TYPE_NULL value, specifically:
    <itemizedlist>
      <listitem><para>if value1 and value2 are both GDA_TYPE_NULL values then the returned value is 0</para></listitem>
      <listitem><para>if value1 is a GDA_TYPE_NULL value and value2 is of another type then the returned value is 1</para></listitem>
      <listitem><para>if value1 is of another type and value2 is a GDA_TYPE_NULL value then the returned value is 1</para></listitem>
      <listitem><para>in all other cases, value1 and value2 must be of the same type and their values are compared</para></listitem>
    </itemizedlist>

    Params:
      value1 = a #GValue to compare.
      value2 = the other #GValue to be compared to value1.
    Returns: a non 0 value if value1 and value2 differ, and 0 if they are equal
*/
int valueDiffer(gobject.value.Value value1, gobject.value.Value value2)
{
  int _retval;
  _retval = gda_value_differ(value1 ? cast(const(GValue)*)value1._cPtr(No.Dup) : null, value2 ? cast(const(GValue)*)value2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests if a given value is of type #GDA_TYPE_NULL.

    Params:
      value = value to test.
    Returns: a boolean that says whether or not value is of type #GDA_TYPE_NULL.
*/
bool valueIsNull(gobject.value.Value value)
{
  bool _retval;
  _retval = cast(bool)gda_value_is_null(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Converts a GValue to its string representation which is a human readable value. Note that the
    returned string does not take into account the current locale of the user (on the contrary to the
    #GdaDataHandler objects). Using this function should be limited to debugging and values serialization
    purposes.
    
    Output is in the "C" locale for numbers, and dates are converted in a YYYY-MM-DD format.

    Params:
      value = a #GValue.
    Returns: a new string, or null if the conversion cannot be done. Free the value with a [glib.global.gfree] when you've finished using it.
*/
string valueStringify(gobject.value.Value value)
{
  char* _cretval;
  _cretval = gda_value_stringify(value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}
