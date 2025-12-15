/// Module for [RepetitiveStatement] class
module gda.repetitive_statement;

import gda.c.functions;
import gda.c.types;
import gda.set;
import gda.statement;
import gda.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class RepetitiveStatement : gobject.object.ObjectWrap
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
    return cast(void function())gda_repetitive_statement_get_type != &gidSymbolNotFound ? gda_repetitive_statement_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RepetitiveStatement self()
  {
    return this;
  }

  /**
      Creates a new #GdaRepetitiveStatement object which, when executed, will execute stmt once for all
      the values set which will have been defined using [gda.repetitive_statement.RepetitiveStatement.appendSet].
      Use [gda.connection.Connection.repetitiveStatementExecute] to actually execute it.
  
      Params:
        stmt = a #GdaStatement object
      Returns: a new #GdaRepetitiveStatement object
  */
  this(gda.statement.Statement stmt)
  {
    GdaRepetitiveStatement* _cretval;
    _cretval = gda_repetitive_statement_new(stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Specifies that rstmt be executed one time with the values contained in values.
      
      A new #GdaSet to be used as the values argument can be obtained using
      [gda.repetitive_statement.RepetitiveStatement.getTemplateSet].
  
      Params:
        values = a #GdaSet object with the values to be used
        makeCopy = true if values is copied, and false if values is only ref'ed
      Returns: a new #GdaRepetitiveStatement object
  */
  bool appendSet(gda.set.Set values, bool makeCopy)
  {
    bool _retval;
    _retval = cast(bool)gda_repetitive_statement_append_set(cast(GdaRepetitiveStatement*)this._cPtr, values ? cast(GdaSet*)values._cPtr(No.Dup) : null, makeCopy);
    return _retval;
  }

  /**
      Get all the values sets which will have been added using [gda.repetitive_statement.RepetitiveStatement.appendSet].
      Returns: a new #GSList of #GdaSet objects (free with [glib.slist.SList.free]).
  */
  gda.set.Set[] getAllSets()
  {
    GSList* _cretval;
    _cretval = gda_repetitive_statement_get_all_sets(cast(GdaRepetitiveStatement*)this._cPtr);
    auto _retval = gSListToD!(gda.set.Set, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Gets a new #GdaSet object with the parameters used by the template statement in the
      rstmt object.
      
      Use this object with [gda.repetitive_statement.RepetitiveStatement.appendSet].
  
      Params:
        set = a place to store the returned template set
      Returns: true on success, false on error
      Throws: [ErrorWrap]
  */
  bool getTemplateSet(gda.set.Set set)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_repetitive_statement_get_template_set(cast(GdaRepetitiveStatement*)this._cPtr, set ? cast(GdaSet**)set._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
