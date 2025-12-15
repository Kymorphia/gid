/// Module for [Column] class
module gda.column;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gobject.value;

/** */
class Column : gobject.object.ObjectWrap
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
    return cast(void function())gda_column_get_type != &gidSymbolNotFound ? gda_column_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Column self()
  {
    return this;
  }

  /** */
  @property string id()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("id");
  }

  /** */
  @property void id(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("id", propval);
  }

  /** */
  this()
  {
    GdaColumn* _cretval;
    _cretval = gda_column_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GdaColumn object from an existing one.
      Returns: a newly allocated #GdaColumn with a copy of the data
        in column.
  */
  gda.column.Column copy()
  {
    GdaColumn* _cretval;
    _cretval = gda_column_copy(cast(GdaColumn*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.column.Column)(cast(GdaColumn*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the 'allow null' flag of the given column.
      Returns: whether the given column allows null values or not (true or false).
  */
  bool getAllowNull()
  {
    bool _retval;
    _retval = cast(bool)gda_column_get_allow_null(cast(GdaColumn*)this._cPtr);
    return _retval;
  }

  /**
      Get the value associated to a named attribute.
      
      Attributes can have any name, but Libgda proposes some default names, see <link linkend="libgda-40-Attributes-manager.synopsis">this section</link>.
  
      Params:
        attribute = attribute name as a string
      Returns: a read-only #GValue, or null if not attribute named attribute has been set for column
  */
  gobject.value.Value getAttribute(string attribute)
  {
    const(GValue)* _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = gda_column_get_attribute(cast(GdaColumn*)this._cPtr, _attribute);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  bool getAutoIncrement()
  {
    bool _retval;
    _retval = cast(bool)gda_column_get_auto_increment(cast(GdaColumn*)this._cPtr);
    return _retval;
  }

  /** */
  string getDbmsType()
  {
    const(char)* _cretval;
    _cretval = gda_column_get_dbms_type(cast(GdaColumn*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  gobject.value.Value getDefaultValue()
  {
    const(GValue)* _cretval;
    _cretval = gda_column_get_default_value(cast(GdaColumn*)this._cPtr);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gda_column_get_description(cast(GdaColumn*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  gobject.types.GType getGType()
  {
    gobject.types.GType _retval;
    _retval = gda_column_get_g_type(cast(GdaColumn*)this._cPtr);
    return _retval;
  }

  /** */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gda_column_get_name(cast(GdaColumn*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  int getPosition()
  {
    int _retval;
    _retval = gda_column_get_position(cast(GdaColumn*)this._cPtr);
    return _retval;
  }

  /**
      Sets the 'allow null' flag of the given column.
  
      Params:
        allow = whether the given column should allows null values or not.
  */
  void setAllowNull(bool allow)
  {
    gda_column_set_allow_null(cast(GdaColumn*)this._cPtr, allow);
  }

  /**
      Set the value associated to a named attribute. The attribute string is 'stolen' by this method, and
      the memory it uses will be freed using the destroy function when no longer needed (if destroy is null,
      then the string will not be freed at all).
      
      Attributes can have any name, but Libgda proposes some default names,
      see <link linkend="libgda-40-Attributes-manager.synopsis">this section</link>.
      
      If there is already an attribute named attribute set, then its value is replaced with the new value (value is
      copied), except if value is null, in which case the attribute is removed.
      
      For example one would use it as:
      
      <code>
      gda_column_set_attribute (holder, g_strdup (my_attribute), g_free, my_value);
      gda_column_set_attribute (holder, GDA_ATTRIBUTE_NAME, NULL, my_value);
      </code>
      
      Note: this method does not modify in any way the contents of the data model for which column is a column (nor
      does it modify the table definition of the tables used by a SELECT statement is the model was created from a
      SELECT statement).
  
      Params:
        attribute = attribute name as a static string
        value = a #GValue, or null
        destroy = a function to be called when attribute is not needed anymore, or null
  */
  void setAttribute(string attribute, gobject.value.Value value = null, glib.types.DestroyNotify destroy = null)
  {
    extern(C) void _destroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;

    const(char)* _attribute = attribute.toCString(No.Alloc);
    gda_column_set_attribute(cast(GdaColumn*)this._cPtr, _attribute, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, _destroyCB);
  }

  /**
      Sets the auto increment flag for the given column.
  
      Params:
        isAuto = auto increment status.
  */
  void setAutoIncrement(bool isAuto)
  {
    gda_column_set_auto_increment(cast(GdaColumn*)this._cPtr, isAuto);
  }

  /**
      Defines column's database type
  
      Params:
        dbmsType = a string
  */
  void setDbmsType(string dbmsType)
  {
    const(char)* _dbmsType = dbmsType.toCString(No.Alloc);
    gda_column_set_dbms_type(cast(GdaColumn*)this._cPtr, _dbmsType);
  }

  /**
      Sets column's default #GValue.
  
      Params:
        defaultValue = default #GValue for the column
  */
  void setDefaultValue(gobject.value.Value defaultValue = null)
  {
    gda_column_set_default_value(cast(GdaColumn*)this._cPtr, defaultValue ? cast(const(GValue)*)defaultValue._cPtr(No.Dup) : null);
  }

  /**
      Sets the column's description
  
      Params:
        title = title name.
  */
  void setDescription(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gda_column_set_description(cast(GdaColumn*)this._cPtr, _title);
  }

  /**
      Sets the type of column to type.
  
      Params:
        type = the new type of column.
  */
  void setGType(gobject.types.GType type)
  {
    gda_column_set_g_type(cast(GdaColumn*)this._cPtr, type);
  }

  /**
      Sets the name of column to name.
  
      Params:
        name = the new name of column.
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gda_column_set_name(cast(GdaColumn*)this._cPtr, _name);
  }

  /**
      Sets the position of the column refer to in the containing
      data model.
  
      Params:
        position = the wanted position of the column in the containing data model.
  */
  void setPosition(int position)
  {
    gda_column_set_position(cast(GdaColumn*)this._cPtr, position);
  }

  /**
      Connect to `GTypeChanged` signal.
  
      Gets emitted whenever column's type has been changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.types.GType oldType, gobject.types.GType newType, gda.column.Column column))
  
          `oldType` the column's previous type (optional)
  
          `newType` the column's new type (optional)
  
          `column` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGTypeChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gobject.types.GType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gobject.types.GType)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gda.column.Column)))
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
    return connectSignalClosure("g-type-changed", closure, after);
  }

  /**
      Connect to `NameChanged` signal.
  
      Gets emitted whenever column's name has been changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string oldName, gda.column.Column column))
  
          `oldName` the column's previous name (optional)
  
          `column` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNameChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.column.Column)))
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
    return connectSignalClosure("name-changed", closure, after);
  }
}
