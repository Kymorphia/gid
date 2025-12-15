/// Module for [Row] class
module gda.row;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import glib.error;
import gobject.object;
import gobject.value;

/** */
class Row : gobject.object.ObjectWrap
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
    return cast(void function())gda_row_get_type != &gidSymbolNotFound ? gda_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Row self()
  {
    return this;
  }

  /** */
  @property void nbValues(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("nb-values", propval);
  }

  /**
      Creates a #GdaRow which can hold count #GValue values.
  
      Params:
        count = number of #GValue in the new #GdaRow.
      Returns: a newly allocated #GdaRow object.
  */
  this(int count)
  {
    GdaRow* _cretval;
    _cretval = gda_row_new(count);
    this(_cretval, Yes.Take);
  }

  /** */
  int getLength()
  {
    int _retval;
    _retval = gda_row_get_length(cast(GdaRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets a pointer to a #GValue stored in a #GdaRow.
      
      This is a pointer to the internal array of values. Don't try to free
      or modify it (modifying is reserved to database provider's implementations).
  
      Params:
        num = field index.
      Returns: a pointer to the #GValue in the position num of row.
  */
  gobject.value.Value getValue(int num)
  {
    GValue* _cretval;
    _cretval = gda_row_get_value(cast(GdaRow*)this._cPtr, num);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Marks value as being invalid. This method is mainly used by database
      providers' implementations to report any error while reading a value from the database.
  
      Params:
        value = a #GValue belonging to row (obtained with [gda.row.Row.getValue]).
  */
  void invalidateValue(gobject.value.Value value)
  {
    gda_row_invalidate_value(cast(GdaRow*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /**
      Marks value as being invalid. This method is mainly used by database
      providers' implementations to report any error while reading a value from the database.
  
      Params:
        value = a #GValue belonging to row (obtained with [gda.row.Row.getValue]).
        error = the error which lead to the invalidation
  */
  void invalidateValueE(gobject.value.Value value, glib.error.ErrorWrap error = null)
  {
    gda_row_invalidate_value_e(cast(GdaRow*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null, error ? cast(GError*)error._cPtr : null);
  }

  /**
      Tells if value has been marked as being invalid by [gda.row.Row.invalidateValue].
      This method is mainly used by database
      providers' implementations to report any error while reading a value from the database.
  
      Params:
        value = a #GValue belonging to row (obtained with [gda.row.Row.getValue]).
      Returns: true if value is valid
  */
  bool valueIsValid(gobject.value.Value value)
  {
    bool _retval;
    _retval = cast(bool)gda_row_value_is_valid(cast(GdaRow*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Tells if value has been marked as being invalid by [gda.row.Row.invalidateValue].
      This method is mainly used by database
      providers' implementations to report any error while reading a value from the database.
  
      Params:
        value = a #GValue belonging to row (obtained with [gda.row.Row.getValue]).
      Returns: true if value is valid
      Throws: [ErrorWrap]
  */
  bool valueIsValidE(gobject.value.Value value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_row_value_is_valid_e(cast(GdaRow*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
