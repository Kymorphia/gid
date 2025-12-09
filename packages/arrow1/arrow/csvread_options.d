/// Module for [CSVReadOptions] class
module arrow.csvread_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.schema;
import arrow.timestamp_parser;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class CSVReadOptions : gobject.object.ObjectWrap
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
    return cast(void function())garrow_csv_read_options_get_type != &gidSymbolNotFound ? garrow_csv_read_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CSVReadOptions self()
  {
    return this;
  }

  /**
      Get `allowNewlinesInValues` property.
      Returns: Whether values are allowed to contain CR (0x0d) and LF (0x0a) characters.
  */
  @property bool allowNewlinesInValues()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-newlines-in-values");
  }

  /**
      Set `allowNewlinesInValues` property.
      Params:
        propval = Whether values are allowed to contain CR (0x0d) and LF (0x0a) characters.
  */
  @property void allowNewlinesInValues(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-newlines-in-values", propval);
  }

  /**
      Get `allowNullStrings` property.
      Returns: Whether string / binary columns can have null values.
      If true, then strings in "null_values" are considered null for string columns.
      If false, then all strings are valid string values.
  */
  @property bool allowNullStrings()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-null-strings");
  }

  /**
      Set `allowNullStrings` property.
      Params:
        propval = Whether string / binary columns can have null values.
        If true, then strings in "null_values" are considered null for string columns.
        If false, then all strings are valid string values.
  */
  @property void allowNullStrings(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-null-strings", propval);
  }

  /**
      Get `blockSize` property.
      Returns: Block size we request from the IO layer; also determines the size
      of chunks when #GArrowCSVReadOptions:use-threads is true.
  */
  @property int blockSize()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("block-size");
  }

  /**
      Set `blockSize` property.
      Params:
        propval = Block size we request from the IO layer; also determines the size
        of chunks when #GArrowCSVReadOptions:use-threads is true.
  */
  @property void blockSize(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("block-size", propval);
  }

  /**
      Get `checkUtf8` property.
      Returns: Whether to check UTF8 validity of string columns.
  */
  @property bool checkUtf8()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("check-utf8");
  }

  /**
      Set `checkUtf8` property.
      Params:
        propval = Whether to check UTF8 validity of string columns.
  */
  @property void checkUtf8(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("check-utf8", propval);
  }

  /**
      Get `delimiter` property.
      Returns: Field delimiter character.
  */
  @property char delimiter()
  {
    return gobject.object.ObjectWrap.getProperty!(char)("delimiter");
  }

  /**
      Set `delimiter` property.
      Params:
        propval = Field delimiter character.
  */
  @property void delimiter(char propval)
  {
    gobject.object.ObjectWrap.setProperty!(char)("delimiter", propval);
  }

  /**
      Get `escapeCharacter` property.
      Returns: Escaping character. This is used only when
      #GArrowCSVReadOptions:is-escaped is true.
  */
  @property char escapeCharacter()
  {
    return gobject.object.ObjectWrap.getProperty!(char)("escape-character");
  }

  /**
      Set `escapeCharacter` property.
      Params:
        propval = Escaping character. This is used only when
        #GArrowCSVReadOptions:is-escaped is true.
  */
  @property void escapeCharacter(char propval)
  {
    gobject.object.ObjectWrap.setProperty!(char)("escape-character", propval);
  }

  /** */
  @property bool generateColumnNames()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("generate-column-names");
  }

  /** */
  @property void generateColumnNames(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("generate-column-names", propval);
  }

  /**
      Get `ignoreEmptyLines` property.
      Returns: Whether empty lines are ignored. If false, an empty line
      represents a simple empty value (assuming a one-column CSV file).
  */
  @property bool ignoreEmptyLines()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("ignore-empty-lines");
  }

  /**
      Set `ignoreEmptyLines` property.
      Params:
        propval = Whether empty lines are ignored. If false, an empty line
        represents a simple empty value (assuming a one-column CSV file).
  */
  @property void ignoreEmptyLines(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("ignore-empty-lines", propval);
  }

  /**
      Get `isDoubleQuoted` property.
      Returns: Whether a quote inside a value is double quoted.
  */
  @property bool isDoubleQuoted()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("is-double-quoted");
  }

  /**
      Set `isDoubleQuoted` property.
      Params:
        propval = Whether a quote inside a value is double quoted.
  */
  @property void isDoubleQuoted(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("is-double-quoted", propval);
  }

  /**
      Get `isEscaped` property.
      Returns: Whether escaping is used.
  */
  @property bool isEscaped()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("is-escaped");
  }

  /**
      Set `isEscaped` property.
      Params:
        propval = Whether escaping is used.
  */
  @property void isEscaped(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("is-escaped", propval);
  }

  /**
      Get `isQuoted` property.
      Returns: Whether quoting is used.
  */
  @property bool isQuoted()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("is-quoted");
  }

  /**
      Set `isQuoted` property.
      Params:
        propval = Whether quoting is used.
  */
  @property void isQuoted(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("is-quoted", propval);
  }

  /**
      Get `nSkipRows` property.
      Returns: The number of header rows to skip (not including
      the row of column names, if any)
  */
  @property uint nSkipRows()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("n-skip-rows");
  }

  /**
      Set `nSkipRows` property.
      Params:
        propval = The number of header rows to skip (not including
        the row of column names, if any)
  */
  @property void nSkipRows(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("n-skip-rows", propval);
  }

  /**
      Get `quoteCharacter` property.
      Returns: Quoting character. This is used only when
      #GArrowCSVReadOptions:is-quoted is true.
  */
  @property char quoteCharacter()
  {
    return gobject.object.ObjectWrap.getProperty!(char)("quote-character");
  }

  /**
      Set `quoteCharacter` property.
      Params:
        propval = Quoting character. This is used only when
        #GArrowCSVReadOptions:is-quoted is true.
  */
  @property void quoteCharacter(char propval)
  {
    gobject.object.ObjectWrap.setProperty!(char)("quote-character", propval);
  }

  /**
      Get `useThreads` property.
      Returns: Whether to use the global CPU thread pool.
  */
  @property bool useThreads()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-threads");
  }

  /**
      Set `useThreads` property.
      Params:
        propval = Whether to use the global CPU thread pool.
  */
  @property void useThreads(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-threads", propval);
  }

  /** */
  this()
  {
    GArrowCSVReadOptions* _cretval;
    _cretval = garrow_csv_read_options_new();
    this(_cretval, Yes.Take);
  }

  /** */
  void addColumnName(string columnName)
  {
    const(char)* _columnName = columnName.toCString(No.Alloc);
    garrow_csv_read_options_add_column_name(cast(GArrowCSVReadOptions*)this._cPtr, _columnName);
  }

  /**
      Add value type of a column.
  
      Params:
        name = The name of the target column.
        dataType = The #GArrowDataType for the column.
  */
  void addColumnType(string name, arrow.data_type.DataType dataType)
  {
    const(char)* _name = name.toCString(No.Alloc);
    garrow_csv_read_options_add_column_type(cast(GArrowCSVReadOptions*)this._cPtr, _name, dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null);
  }

  /** */
  void addFalseValue(string falseValue)
  {
    const(char)* _falseValue = falseValue.toCString(No.Alloc);
    garrow_csv_read_options_add_false_value(cast(GArrowCSVReadOptions*)this._cPtr, _falseValue);
  }

  /** */
  void addNullValue(string nullValue)
  {
    const(char)* _nullValue = nullValue.toCString(No.Alloc);
    garrow_csv_read_options_add_null_value(cast(GArrowCSVReadOptions*)this._cPtr, _nullValue);
  }

  /**
      Add value types for columns in the schema.
  
      Params:
        schema = The #GArrowSchema that specifies columns and their types.
  */
  void addSchema(arrow.schema.Schema schema)
  {
    garrow_csv_read_options_add_schema(cast(GArrowCSVReadOptions*)this._cPtr, schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null);
  }

  /** */
  void addTimestampParser(arrow.timestamp_parser.TimestampParser parser)
  {
    garrow_csv_read_options_add_timestamp_parser(cast(GArrowCSVReadOptions*)this._cPtr, parser ? cast(GArrowTimestampParser*)parser._cPtr(No.Dup) : null);
  }

  /** */
  void addTrueValue(string trueValue)
  {
    const(char)* _trueValue = trueValue.toCString(No.Alloc);
    garrow_csv_read_options_add_true_value(cast(GArrowCSVReadOptions*)this._cPtr, _trueValue);
  }

  /** */
  string[] getColumnNames()
  {
    char** _cretval;
    _cretval = garrow_csv_read_options_get_column_names(cast(GArrowCSVReadOptions*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  arrow.data_type.DataType[string] getColumnTypes()
  {
    GHashTable* _cretval;
    _cretval = garrow_csv_read_options_get_column_types(cast(GArrowCSVReadOptions*)this._cPtr);
    auto _retval = gHashTableToD!(string, arrow.data_type.DataType, GidOwnership.Full)(cast(GHashTable*)_cretval);
    return _retval;
  }

  /** */
  string[] getFalseValues()
  {
    char** _cretval;
    _cretval = garrow_csv_read_options_get_false_values(cast(GArrowCSVReadOptions*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  string[] getNullValues()
  {
    char** _cretval;
    _cretval = garrow_csv_read_options_get_null_values(cast(GArrowCSVReadOptions*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  arrow.timestamp_parser.TimestampParser[] getTimestampParsers()
  {
    GList* _cretval;
    _cretval = garrow_csv_read_options_get_timestamp_parsers(cast(GArrowCSVReadOptions*)this._cPtr);
    auto _retval = gListToD!(arrow.timestamp_parser.TimestampParser, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  string[] getTrueValues()
  {
    char** _cretval;
    _cretval = garrow_csv_read_options_get_true_values(cast(GArrowCSVReadOptions*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  void setColumnNames(string[] columnNames)
  {
    size_t _nColumnNames;
    if (columnNames)
      _nColumnNames = cast(size_t)columnNames.length;

    char*[] _tmpcolumnNames;
    foreach (s; columnNames)
      _tmpcolumnNames ~= s.toCString(No.Alloc);
    const(char*)* _columnNames = _tmpcolumnNames.ptr;
    garrow_csv_read_options_set_column_names(cast(GArrowCSVReadOptions*)this._cPtr, _columnNames, _nColumnNames);
  }

  /** */
  void setFalseValues(string[] falseValues)
  {
    size_t _nFalseValues;
    if (falseValues)
      _nFalseValues = cast(size_t)falseValues.length;

    char*[] _tmpfalseValues;
    foreach (s; falseValues)
      _tmpfalseValues ~= s.toCString(No.Alloc);
    const(char*)* _falseValues = _tmpfalseValues.ptr;
    garrow_csv_read_options_set_false_values(cast(GArrowCSVReadOptions*)this._cPtr, _falseValues, _nFalseValues);
  }

  /** */
  void setNullValues(string[] nullValues)
  {
    size_t _nNullValues;
    if (nullValues)
      _nNullValues = cast(size_t)nullValues.length;

    char*[] _tmpnullValues;
    foreach (s; nullValues)
      _tmpnullValues ~= s.toCString(No.Alloc);
    const(char*)* _nullValues = _tmpnullValues.ptr;
    garrow_csv_read_options_set_null_values(cast(GArrowCSVReadOptions*)this._cPtr, _nullValues, _nNullValues);
  }

  /** */
  void setTimestampParsers(arrow.timestamp_parser.TimestampParser[] parsers)
  {
    auto _parsers = gListFromD!(arrow.timestamp_parser.TimestampParser)(parsers);
    scope(exit) containerFree!(GList*, arrow.timestamp_parser.TimestampParser, GidOwnership.None)(_parsers);
    garrow_csv_read_options_set_timestamp_parsers(cast(GArrowCSVReadOptions*)this._cPtr, _parsers);
  }

  /** */
  void setTrueValues(string[] trueValues)
  {
    size_t _nTrueValues;
    if (trueValues)
      _nTrueValues = cast(size_t)trueValues.length;

    char*[] _tmptrueValues;
    foreach (s; trueValues)
      _tmptrueValues ~= s.toCString(No.Alloc);
    const(char*)* _trueValues = _tmptrueValues.ptr;
    garrow_csv_read_options_set_true_values(cast(GArrowCSVReadOptions*)this._cPtr, _trueValues, _nTrueValues);
  }
}
