/// Module for [Batch] class
module gda.batch;

import gda.c.functions;
import gda.c.types;
import gda.set;
import gda.statement;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;

/** */
class Batch : gobject.object.ObjectWrap
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
    return cast(void function())gda_batch_get_type != &gidSymbolNotFound ? gda_batch_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Batch self()
  {
    return this;
  }

  /**
      Creates a new #GdaBatch object
      Returns: the new object
  */
  this()
  {
    GdaBatch* _cretval;
    _cretval = gda_batch_new();
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_batch_error_quark();
    return _retval;
  }

  /**
      Add stmt to the list of statements managed by batch. A #GdaStatement object can be
      added multiple times to a #GdaBatch object.
  
      Params:
        stmt = a statement to add to batch's statements list
  */
  void addStatement(gda.statement.Statement stmt)
  {
    gda_batch_add_statement(cast(GdaBatch*)this._cPtr, stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null);
  }

  /**
      Copy constructor
      Returns: a the new copy of orig
  */
  gda.batch.Batch copy()
  {
    GdaBatch* _cretval;
    _cretval = gda_batch_copy(cast(GdaBatch*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.batch.Batch)(cast(GdaBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a new #GdaSet object which groups all the execution parameters
      which batch needs for all the statements it includes.
      This new object is returned though out_params.
      
      Note that if batch does not need any parameter, then out_params is set to null.
  
      Params:
        outParams = a place to store a new #GdaSet object, or null
      Returns: TRUE if no error occurred.
      Throws: [BatchException]
  */
  bool getParameters(out gda.set.Set outParams)
  {
    bool _retval;
    GdaSet* _outParams;
    GError *_err;
    _retval = cast(bool)gda_batch_get_parameters(cast(GdaBatch*)this._cPtr, &_outParams, &_err);
    if (_err)
      throw new BatchException(_err);
    outParams = new gda.set.Set(cast(void*)_outParams, Yes.Take);
    return _retval;
  }

  /**
      Get a list of the #GdaStatement objects contained in batch
      Returns: a list of #GdaStatement which should not be modified.
  */
  gda.statement.Statement[] getStatements()
  {
    const(GSList)* _cretval;
    _cretval = gda_batch_get_statements(cast(GdaBatch*)this._cPtr);
    auto _retval = gSListToD!(gda.statement.Statement, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Removes stmt from the list of statements managed by batch. If stmt is present several
      times in batch's statements' list, then only the first one is removed.
  
      Params:
        stmt = a statement to remove from batch's statements list
  */
  void removeStatement(gda.statement.Statement stmt)
  {
    gda_batch_remove_statement(cast(GdaBatch*)this._cPtr, stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null);
  }

  /**
      Creates a string representing the contents of batch.
      Returns: a string containing the serialized version of batch
  */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_batch_serialize(cast(GdaBatch*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Gets emitted whenever a #GdaStatement in the batch object changes
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.object.ObjectWrap changedStmt, gda.batch.Batch batch))
  
          `changedStmt` the statement which has been changed (optional)
  
          `batch` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.batch.Batch)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}

class BatchException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.batch.Batch.errorQuark, cast(int)code, msg);
  }

  alias Code = BatchError;
}
