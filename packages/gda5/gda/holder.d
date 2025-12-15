/// Module for [Holder] class
module gda.holder;

import gda.c.functions;
import gda.c.types;
import gda.data_handler;
import gda.data_model;
import gda.lockable;
import gda.lockable_mixin;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gobject.value;

/** */
class Holder : gobject.object.ObjectWrap, gda.lockable.Lockable
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
    return cast(void function())gda_holder_get_type != &gidSymbolNotFound ? gda_holder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Holder self()
  {
    return this;
  }

  /** */
  @property string description()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("description");
  }

  /** */
  @property void description(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("description", propval);
  }

  /** */
  @property gda.holder.Holder fullBind()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.holder.Holder)("full-bind");
  }

  /** */
  @property void fullBind(gda.holder.Holder propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.holder.Holder)("full-bind", propval);
  }

  /** */
  @property gobject.types.GType gType()
  {
    return getGType();
  }

  /** */
  @property void gType(gobject.types.GType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gobject.types.GType)("g-type", propval);
  }

  /** */
  @property string id()
  {
    return getId();
  }

  /** */
  @property void id(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("id", propval);
  }

  /** */
  @property string name()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("name");
  }

  /** */
  @property void name(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("name", propval);
  }

  /** */
  @property bool notNull()
  {
    return getNotNull();
  }

  /** */
  @property void notNull(bool propval)
  {
    return setNotNull(propval);
  }

  /** */
  @property gda.holder.Holder simpleBind()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.holder.Holder)("simple-bind");
  }

  /** */
  @property void simpleBind(gda.holder.Holder propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.holder.Holder)("simple-bind", propval);
  }

  /** */
  @property int sourceColumn()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("source-column");
  }

  /** */
  @property void sourceColumn(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("source-column", propval);
  }

  /** */
  @property gda.data_model.DataModel sourceModel()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.data_model.DataModel)("source-model");
  }

  /** */
  @property void sourceModel(gda.data_model.DataModel propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.data_model.DataModel)("source-model", propval);
  }

  /**
      Get `validateChanges` property.
      Returns: Defines if the "validate-change" signal gets emitted when
      the holder's value changes.
  */
  @property bool validateChanges()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("validate-changes");
  }

  /**
      Set `validateChanges` property.
      Params:
        propval = Defines if the "validate-change" signal gets emitted when
        the holder's value changes.
  */
  @property void validateChanges(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("validate-changes", propval);
  }

  mixin LockableT!();

  /**
      Creates a new holder of type type
  
      Params:
        type = the #GType requested
      Returns: a new #GdaHolder object
  */
  this(gobject.types.GType type)
  {
    GdaHolder* _cretval;
    _cretval = gda_holder_new(type);
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_holder_error_quark();
    return _retval;
  }

  /**
      Copy constructor.
      
      Note1: if orig is set with a static value (see [gda.holder.Holder.takeStaticValue])
      its copy will have a fresh new allocated GValue, so that user should free it when done.
      Returns: a new #GdaHolder object
  */
  gda.holder.Holder copy()
  {
    GdaHolder* _cretval;
    _cretval = gda_holder_copy(cast(GdaHolder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.holder.Holder)(cast(GdaHolder*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Forces a holder to be invalid; to set it valid again, a new value must be assigned
      to it using [gda.holder.Holder.setValue] or [gda.holder.Holder.takeValue].
      
      holder's value is set to null.
  */
  void forceInvalid()
  {
    gda_holder_force_invalid(cast(GdaHolder*)this._cPtr);
  }

  /**
      Forces a holder to be invalid; to set it valid again, a new value must be assigned
      to it using [gda.holder.Holder.setValue] or [gda.holder.Holder.takeValue].
      
      holder's value is set to null.
  
      Params:
        error = a #GError explaining why holder is declared invalid, or null
  */
  void forceInvalidE(glib.error.ErrorWrap error = null)
  {
    gda_holder_force_invalid_e(cast(GdaHolder*)this._cPtr, error ? cast(GError*)error._cPtr : null);
  }

  /**
      Get an "encoded" version of holder's name. The "encoding" consists in replacing non
      alphanumeric character with the string "__gdaXX" where XX is the hex. representation
      of the non alphanumeric char.
      
      This method is just a wrapper around the [gda.global.textToAlphanum] function.
      Returns: a new string
  */
  string getAlphanumId()
  {
    char* _cretval;
    _cretval = gda_holder_get_alphanum_id(cast(GdaHolder*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the value associated to a named attribute.
      
      Attributes can have any name, but Libgda proposes some default names, see <link linkend="libgda-40-Attributes-manager.synopsis">this section</link>.
  
      Params:
        attribute = attribute name as a string
      Returns: a read-only #GValue, or null if not attribute named attribute has been set for holder
  */
  gobject.value.Value getAttribute(string attribute)
  {
    const(GValue)* _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = gda_holder_get_attribute(cast(GdaHolder*)this._cPtr, _attribute);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the holder which makes holder change its value when the holder's value is changed.
      Returns: the #GdaHolder or null
  */
  gda.holder.Holder getBind()
  {
    GdaHolder* _cretval;
    _cretval = gda_holder_get_bind(cast(GdaHolder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.holder.Holder)(cast(GdaHolder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the default value held into the holder. WARNING: the default value does not need to be of
      the same type as the one required by holder.
      Returns: the default value
  */
  gobject.value.Value getDefaultValue()
  {
    const(GValue)* _cretval;
    _cretval = gda_holder_get_default_value(cast(GdaHolder*)this._cPtr);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gobject.types.GType getGType()
  {
    gobject.types.GType _retval;
    _retval = gda_holder_get_g_type(cast(GdaHolder*)this._cPtr);
    return _retval;
  }

  /**
      Get the ID of holder. The ID can be set using holder's "id" property
      Returns: the ID (don't modify the string).
  */
  string getId()
  {
    const(char)* _cretval;
    _cretval = gda_holder_get_id(cast(GdaHolder*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get wether the holder can be NULL or not
      Returns: TRUE if the holder cannot be NULL
  */
  bool getNotNull()
  {
    bool _retval;
    _retval = cast(bool)gda_holder_get_not_null(cast(GdaHolder*)this._cPtr);
    return _retval;
  }

  /**
      Get the value held into the holder. If holder is set to use its default value
      and that default value is not of the same type as holder, then null is returned.
      
      If holder is set to NULL, then the returned value is a #GDA_TYPE_NULL GValue.
      
      If holder is invalid, then the returned value is null.
      Returns: the value, or null
  */
  gobject.value.Value getValue()
  {
    const(GValue)* _cretval;
    _cretval = gda_holder_get_value(cast(GdaHolder*)this._cPtr);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Same functionality as [gda.holder.Holder.getValue] except that it returns the value as a string
      (the conversion is done using dh if not null, or the default data handler otherwise).
  
      Params:
        dh = a #GdaDataHandler to use, or null
      Returns: the value, or null
  */
  string getValueStr(gda.data_handler.DataHandler dh = null)
  {
    char* _cretval;
    _cretval = gda_holder_get_value_str(cast(GdaHolder*)this._cPtr, dh ? cast(GdaDataHandler*)(cast(gobject.object.ObjectWrap)dh)._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the validity of holder (that is, of the value held by holder)
      Returns: TRUE if holder's value can safely be used
  */
  bool isValid()
  {
    bool _retval;
    _retval = cast(bool)gda_holder_is_valid(cast(GdaHolder*)this._cPtr);
    return _retval;
  }

  /**
      Get the validity of holder (that is, of the value held by holder)
      Returns: TRUE if holder's value can safely be used
      Throws: [HolderException]
  */
  bool isValidE()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_holder_is_valid_e(cast(GdaHolder*)this._cPtr, &_err);
    if (_err)
      throw new HolderException(_err);
    return _retval;
  }

  /**
      Set the value associated to a named attribute. The attribute string is 'stolen' by this method, and
      the memory it uses will be freed using the destroy function when no longer needed (if destroy is null,
      then the string will not be freed at all).
      
      Attributes can have any name, but Libgda proposes some default names,
      see <link linkend="libgda-5.0-Attributes-manager.synopsis">this section</link>.
      
      For example one would use it as:
      
      <code>gda_holder_set_attribute (holder, g_strdup (my_attribute), my_value, g_free);</code>
      <code>gda_holder_set_attribute (holder, GDA_ATTRIBUTE_NAME, my_value, NULL);</code>
      
      If there is already an attribute named attribute set, then its value is replaced with the new value (value is
      copied), except if value is null, in which case the attribute is removed.
  
      Params:
        attribute = attribute name
        value = a #GValue, or null
        destroy = a function to be called when attribute is not needed anymore, or null
  */
  void setAttribute(string attribute, gobject.value.Value value, glib.types.DestroyNotify destroy)
  {
    extern(C) void _destroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;

    const(char)* _attribute = attribute.toCString(No.Alloc);
    gda_holder_set_attribute(cast(GdaHolder*)this._cPtr, _attribute, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, _destroyCB);
  }

  /**
      Sets holder to change when bind_to changes (and does not make bind_to change when holder changes).
      For the operation to succeed, the GType of holder and bind_to must be the same, with the exception that
      any of them can have a `GDA_TYPE_NULL` type (in this situation, the GType of the two #GdaHolder objects
      involved is set to match the other when any of them sets its type to something different than GDA_TYPE_NULL).
      
      If bind_to is null, then holder will not be bound anymore.
  
      Params:
        bindTo = a #GdaHolder or null
      Returns: TRUE if no error occurred
      Throws: [HolderException]
  */
  bool setBind(gda.holder.Holder bindTo)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_holder_set_bind(cast(GdaHolder*)this._cPtr, bindTo ? cast(GdaHolder*)bindTo._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new HolderException(_err);
    return _retval;
  }

  /**
      Sets the default value within the holder. If value is null then holder won't have a
      default value anymore. To set a default value to null, then pass a #GValue created using
      [gda.global.valueNewNull].
      
      NOTE: the default value does not need to be of the same type as the one required by holder.
  
      Params:
        value = a value to set the holder's default value, or null
  */
  void setDefaultValue(gobject.value.Value value)
  {
    gda_holder_set_default_value(cast(GdaHolder*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets if the holder can have a NULL value. If not_null is TRUE, then that won't be allowed
  
      Params:
        notNull = TRUE if holder should not accept null values
  */
  void setNotNull(bool notNull)
  {
    gda_holder_set_not_null(cast(GdaHolder*)this._cPtr, notNull);
  }

  /**
      Sets an hint that holder's values should be restricted among the values
      contained in the col column of the model data model. Note that this is just a hint,
      meaning this policy is not enforced by holder's implementation.
      
      If model is null, then the effect is to cancel ant previous call to [gda.holder.Holder.setSourceModel]
      where model was not null.
  
      Params:
        model = a #GdaDataModel object or null
        col = the reference column in model
      Returns: TRUE if no error occurred
      Throws: [HolderException]
  */
  bool setSourceModel(gda.data_model.DataModel model, int col)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_holder_set_source_model(cast(GdaHolder*)this._cPtr, model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null, col, &_err);
    if (_err)
      throw new HolderException(_err);
    return _retval;
  }

  /**
      Sets the value within the holder. If holder is an alias for another
      holder, then the value is also set for that other holder.
      
      On success, the action of any call to [gda.holder.Holder.forceInvalid] is cancelled
      as soon as this method is called (even if holder's value does not actually change)
      
      If the value is not different from the one already contained within holder,
      then holder is not changed and no signal is emitted.
      
      Note1: the value argument is treated the same way if it is null or if it is a #GDA_TYPE_NULL value
      
      Note2: if holder can't accept the value value, then this method returns FALSE, and holder will be left
      in an invalid state.
      
      Note3: before the change is accepted by holder, the "validate-change" signal will be emitted (the value
      of which can prevent the change from happening) which can be connected to to have a greater control
      of which values holder can have, or implement some business rules.
  
      Params:
        value = a value to set the holder to, or null
      Returns: TRUE if value has been set
      Throws: [HolderException]
  */
  bool setValue(gobject.value.Value value = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_holder_set_value(cast(GdaHolder*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new HolderException(_err);
    return _retval;
  }

  /**
      Same functionality as [gda.holder.Holder.setValue] except that it uses a string representation
      of the value to set, which will be converted into a GValue first (using default data handler if
      dh is null).
      
      Note1: if value is null or is the "NULL" string, then holder's value is set to null.
      Note2: if holder can't accept the value value, then this method returns FALSE, and holder will be left
      in an invalid state.
  
      Params:
        dh = a #GdaDataHandler to use, or null
        value = a value to set the holder to, as a string
      Returns: TRUE if value has been set
      Throws: [HolderException]
  */
  bool setValueStr(gda.data_handler.DataHandler dh, string value)
  {
    bool _retval;
    const(char)* _value = value.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_holder_set_value_str(cast(GdaHolder*)this._cPtr, dh ? cast(GdaDataHandler*)(cast(gobject.object.ObjectWrap)dh)._cPtr(No.Dup) : null, _value, &_err);
    if (_err)
      throw new HolderException(_err);
    return _retval;
  }

  /**
      Set holder's value to its default value.
      Returns: TRUE if holder has got a default value
  */
  bool setValueToDefault()
  {
    bool _retval;
    _retval = cast(bool)gda_holder_set_value_to_default(cast(GdaHolder*)this._cPtr);
    return _retval;
  }

  /**
      Sets the value within the holder. If holder is an alias for another
      holder, then the value is also set for that other holder.
      
      On success, the action of any call to [gda.holder.Holder.forceInvalid] is cancelled
      as soon as this method is called (even if holder's value does not actually change).
      
      If the value is not different from the one already contained within holder,
      then holder is not changed and no signal is emitted.
      
      Note1: if holder can't accept the value value, then this method returns FALSE, and holder will be left
      in an invalid state.
      
      Note2: before the change is accepted by holder, the "validate-change" signal will be emitted (the value
      of which can prevent the change from happening) which can be connected to to have a greater control
      of which values holder can have, or implement some business rules.
      
      Note3: if user previously set this holder with gda_holder_take_static_value () the GValue
      stored internally will be forgiven and replaced by the value. User should then
      take care of the 'old' static GValue.
  
      Params:
        value = a value to set the holder to
      Returns: TRUE if value has been set
      Throws: [HolderException]
  */
  bool takeValue(gobject.value.Value value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_holder_take_value(cast(GdaHolder*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null, &_err);
    if (_err)
      throw new HolderException(_err);
    return _retval;
  }

  /**
      Tells if holder's current value is the default one.
      Returns: TRUE if holder holder's current value is the default one
  */
  bool valueIsDefault()
  {
    bool _retval;
    _retval = cast(bool)gda_holder_value_is_default(cast(GdaHolder*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `AttributeChanged` signal.
  
      Gets emitted when any holder's attribute has changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string attName, gobject.value.Value attValue, gda.holder.Holder holder))
  
          `attName` attribute's name (optional)
  
          `attValue` attribute's value (optional)
  
          `holder` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAttributeChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gobject.value.Value)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gda.holder.Holder)))
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
    return connectSignalClosure("attribute-changed", closure, after);
  }

  /**
      Connect to `Changed` signal.
  
      Gets emitted when holder's value has changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.holder.Holder holder))
  
          `holder` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.holder.Holder)))
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
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `SourceChanged` signal.
  
      Gets emitted when the data model in which holder's values should be has changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.holder.Holder holder))
  
          `holder` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSourceChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.holder.Holder)))
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
    return connectSignalClosure("source-changed", closure, after);
  }

  /**
      Connect to `ValidateChange` signal.
  
      Gets emitted when holder is going to change its value. One can connect to
      this signal to control which values holder can have (for example to implement some business rules)
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D glib.error.ErrorWrap callback(gobject.value.Value newValue, gda.holder.Holder holder))
  
          `newValue` the proposed new value for holder (optional)
  
          `holder` the instance the signal is connected to (optional)
  
          `Returns` NULL if holder is allowed to change its value to new_value, or a #GError
          otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValidateChange(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == glib.error.ErrorWrap)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gobject.value.Value)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.holder.Holder)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(glib.error.ErrorWrap)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("validate-change", closure, after);
  }
}

class HolderException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.holder.Holder.errorQuark, cast(int)code, msg);
  }

  alias Code = HolderError;
}
