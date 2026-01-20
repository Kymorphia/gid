/// Module for [Statement] class
module gda.statement;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.holder;
import gda.set;
import gda.sql_rendering_context;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;

/** */
class Statement : gobject.object.ObjectWrap
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
    return cast(void function())gda_statement_get_type != &gidSymbolNotFound ? gda_statement_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Statement self()
  {
    return this;
  }

  /** */
  @property void* structure()
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("structure");
  }

  /** */
  @property void structure(void* propval)
  {
    gobject.object.ObjectWrap.setProperty!(void*)("structure", propval);
  }

  /**
      Creates a new #GdaStatement object
      Returns: the new object
  */
  this()
  {
    GdaStatement* _cretval;
    _cretval = gda_statement_new();
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_statement_error_quark();
    return _retval;
  }

  /**
      Checks that stmt's structure is correct.
      Returns: TRUE if stmt's structure is correct
      Throws: [StatementException]
  */
  bool checkStructure()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_statement_check_structure(cast(GdaStatement*)this._cPtr, &_err);
    if (_err)
      throw new StatementException(_err);
    return _retval;
  }

  /**
      If cnc is not null then checks that every object (table, field, function) used in stmt
      actually exists in cnc's database
      
      If cnc is null, then cleans anything related to cnc in stmt.
      
      See [gda.sql_statement.SqlStatement.checkValidity] for more information.
  
      Params:
        cnc = a #GdaConnection object, or null
      Returns: TRUE if every object actually exists in cnc's database
      Throws: [StatementException]
  */
  bool checkValidity(gda.connection.Connection cnc = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_statement_check_validity(cast(GdaStatement*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new StatementException(_err);
    return _retval;
  }

  /**
      Copy constructor
      Returns: a the new copy of orig
  */
  gda.statement.Statement copy()
  {
    GdaStatement* _cretval;
    _cretval = gda_statement_copy(cast(GdaStatement*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.statement.Statement)(cast(GdaStatement*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a new #GdaSet object which groups all the execution parameters
      which stmt needs. This new object is returned though out_params.
      
      Note that if stmt does not need any parameter, then out_params is set to null.
  
      Params:
        outParams = a place to store a new #GdaSet object, or null
      Returns: TRUE if no error occurred.
      Throws: [StatementException]
  */
  bool getParameters(out gda.set.Set outParams)
  {
    bool _retval;
    GdaSet* _outParams;
    GError *_err;
    _retval = cast(bool)gda_statement_get_parameters(cast(GdaStatement*)this._cPtr, &_outParams, &_err);
    if (_err)
      throw new StatementException(_err);
    outParams = new gda.set.Set(cast(void*)_outParams, Yes.Take);
    return _retval;
  }

  /**
      Get the type of statement held by stmt. It returns GDA_SQL_STATEMENT_NONE if
      stmt does not hold any statement
      Returns: the statement type
  */
  gda.types.SqlStatementType getStatementType()
  {
    GdaSqlStatementType _cretval;
    _cretval = gda_statement_get_statement_type(cast(GdaStatement*)this._cPtr);
    gda.types.SqlStatementType _retval = cast(gda.types.SqlStatementType)_cretval;
    return _retval;
  }

  /**
      Tells if stmt is composed only of spaces (that is it has no real SQL code), and is completely
      useless as such.
      Returns: TRUE if executing stmt does nothing
  */
  bool isUseless()
  {
    bool _retval;
    _retval = cast(bool)gda_statement_is_useless(cast(GdaStatement*)this._cPtr);
    return _retval;
  }

  /**
      "Normalizes" some parts of stmt, see [gda.sql_statement.SqlStatement.normalize] for more
      information.
  
      Params:
        cnc = a #GdaConnection object
      Returns: TRUE if no error occurred
      Throws: [StatementException]
  */
  bool normalize(gda.connection.Connection cnc)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_statement_normalize(cast(GdaStatement*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new StatementException(_err);
    return _retval;
  }

  /**
      Creates a string representing the contents of stmt.
      Returns: a string containing the serialized version of stmt
  */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_statement_serialize(cast(GdaStatement*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Renders stmt as an SQL statement, with some control on how it is rendered.
      
      If cnc is not null, then the rendered SQL will better be suited to be used by cnc (in particular
      it may include some SQL tweaks and/or proprietary extensions specific to the database engine used by cnc):
      in this case the result is similar to calling [gda.connection.Connection.statementToSql].
  
      Params:
        cnc = a #GdaConnection object, or null
        params = parameters contained in a single #GdaSet object, or null
        flags = a set of flags to control the rendering
        paramsUsed = a place to store the list of actual #GdaHolder objects in params used to do the rendering, or null
      Returns: a new string if no error occurred
      Throws: [StatementException]
  */
  string toSqlExtended(gda.connection.Connection cnc, gda.set.Set params, gda.types.StatementSqlFlag flags, out gda.holder.Holder[] paramsUsed)
  {
    char* _cretval;
    GSList* _paramsUsed;
    GError *_err;
    _cretval = gda_statement_to_sql_extended(cast(GdaStatement*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, params ? cast(GdaSet*)params._cPtr(No.Dup) : null, flags, &_paramsUsed, &_err);
    if (_err)
      throw new StatementException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    paramsUsed = gSListToD!(gda.holder.Holder, GidOwnership.Container)(_paramsUsed);
    return _retval;
  }

  /**
      Renders stmt to its SQL representation, using context to specify how each part of stmt must
      be rendered. This function is mainly used by database provider's implementations which require
      to specialize some aspects of SQL rendering to be adapted to the database,'s own SQL dialect
      (for example SQLite rewrites the 'FALSE' and 'TRUE' literals as '0' and 'NOT 0').
  
      Params:
        context = a #GdaSqlRenderingContext context
      Returns: a new string, or null if an error occurred
      Throws: [StatementException]
  */
  string toSqlReal(gda.sql_rendering_context.SqlRenderingContext context)
  {
    char* _cretval;
    GError *_err;
    _cretval = gda_statement_to_sql_real(cast(GdaStatement*)this._cPtr, context ? cast(GdaSqlRenderingContext*)context._cPtr : null, &_err);
    if (_err)
      throw new StatementException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Connect to `Checked` signal.
  
      Gets emitted whenever the structure and contents
        of the statement have been verified (emitted after [gda.statement.Statement.checkValidity]).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.connection.Connection object, bool p0, gda.statement.Statement statement))
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `statement` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChecked(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.connection.Connection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gda.statement.Statement)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("checked", closure, after);
  }

  /**
      Connect to `Reset` signal.
  
      Gets emitted whenever the statement has changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.statement.Statement statement))
  
          `statement` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectReset(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.statement.Statement)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("reset", closure, after);
  }
}

class StatementException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.statement.Statement.errorQuark, cast(int)code, msg);
  }

  alias Code = StatementError;
}
