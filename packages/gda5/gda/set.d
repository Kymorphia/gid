/// Module for [Set] class
module gda.set;

import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.holder;
import gda.set_group;
import gda.set_node;
import gda.set_source;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gobject.value;
import libxml2.types;

/** */
class Set : gobject.object.ObjectWrap
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
    return cast(void function())gda_set_get_type != &gidSymbolNotFound ? gda_set_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Set self()
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
  @property string name()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("name");
  }

  /** */
  @property void name(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("name", propval);
  }

  /**
      Get `validateChanges` property.
      Returns: Defines if the "validate-set" signal gets emitted when
        any holder in the data set changes. This property also affects the
        GdaHolder:validate-changes property.
  */
  @property bool validateChanges()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("validate-changes");
  }

  /**
      Set `validateChanges` property.
      Params:
        propval = Defines if the "validate-set" signal gets emitted when
          any holder in the data set changes. This property also affects the
          GdaHolder:validate-changes property.
  */
  @property void validateChanges(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("validate-changes", propval);
  }

  /**
      Creates a new #GdaSet object, and populates it with the list given as argument.
      The list can then be freed as it is copied. All the value holders in holders are referenced counted
      and modified, so they should not be used anymore afterwards.
  
      Params:
        holders = a list of #GdaHolder objects
      Returns: a new #GdaSet object
  */
  this(gda.holder.Holder[] holders)
  {
    GdaSet* _cretval;
    auto _holders = gSListFromD!(gda.holder.Holder)(holders);
    scope(exit) containerFree!(GSList*, gda.holder.Holder, GidOwnership.None)(_holders);
    _cretval = gda_set_new(_holders);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GdaSet object from the xml_spec
      specifications
  
      Params:
        xmlSpec = a #xmlNodePtr for a &lt;parameters&gt; tag
      Returns: a new object, or null if an error occurred
      Throws: [SetException]
  */
  static gda.set.Set newFromSpecNode(libxml2.types.NodePtr xmlSpec)
  {
    GdaSet* _cretval;
    GError *_err;
    _cretval = gda_set_new_from_spec_node(xmlSpec, &_err);
    if (_err)
      throw new SetException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.set.Set)(cast(GdaSet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GdaSet object from the xml_spec
      specifications
  
      Params:
        xmlSpec = a string
      Returns: a new object, or null if an error occurred
      Throws: [SetException]
  */
  static gda.set.Set newFromSpecString(string xmlSpec)
  {
    GdaSet* _cretval;
    const(char)* _xmlSpec = xmlSpec.toCString(No.Alloc);
    GError *_err;
    _cretval = gda_set_new_from_spec_string(_xmlSpec, &_err);
    if (_err)
      throw new SetException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.set.Set)(cast(GdaSet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GdaSet like [gda.set.Set.new_], but does not allow modifications to any of the #GdaHolder
      object in holders. This function is used for Libgda's database providers' implementation.
  
      Params:
        holders = a list of #GdaHolder objects
      Returns: a new #GdaSet object
  */
  static gda.set.Set newReadOnly(gda.holder.Holder[] holders)
  {
    GdaSet* _cretval;
    auto _holders = gSListFromD!(gda.holder.Holder)(holders);
    scope(exit) containerFree!(GSList*, gda.holder.Holder, GidOwnership.None)(_holders);
    _cretval = gda_set_new_read_only(_holders);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.set.Set)(cast(GdaSet*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_set_error_quark();
    return _retval;
  }

  /**
      Adds holder to the list of holders managed within set.
      
      NOTE: if set already has a #GdaHolder with the same ID as holder, then holder
      will not be added to the set (even if holder's type or value is not the same as the
      one already in set).
  
      Params:
        holder = a #GdaHolder object
      Returns: TRUE if holder has been added to set (and FALSE if it has not been added because there is another #GdaHolder
        with the same ID)
  */
  bool addHolder(gda.holder.Holder holder)
  {
    bool _retval;
    _retval = cast(bool)gda_set_add_holder(cast(GdaSet*)this._cPtr, holder ? cast(GdaHolder*)holder._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Creates a new #GdaSet object, copy of set
      Returns: a new #GdaSet object
  */
  gda.set.Set copy()
  {
    GdaSet* _cretval;
    _cretval = gda_set_copy(cast(GdaSet*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.set.Set)(cast(GdaSet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Finds a #GdaSetGroup which lists a  #GdaSetNode containing holder,
      don't modify the returned structure.
  
      Params:
        holder = a #GdaHolder object
      Returns: the requested #GdaSetGroup or null
  */
  gda.set_group.SetGroup getGroup(gda.holder.Holder holder)
  {
    GdaSetGroup* _cretval;
    _cretval = gda_set_get_group(cast(GdaSet*)this._cPtr, holder ? cast(GdaHolder*)holder._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gda.set_group.SetGroup(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Finds a #GdaHolder using its ID
  
      Params:
        holderId = the ID of the requested value holder
      Returns: the requested #GdaHolder or null
  */
  gda.holder.Holder getHolder(string holderId)
  {
    GdaHolder* _cretval;
    const(char)* _holderId = holderId.toCString(No.Alloc);
    _cretval = gda_set_get_holder(cast(GdaSet*)this._cPtr, _holderId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.holder.Holder)(cast(GdaHolder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the value of the #GdaHolder which ID is holder_id
  
      Params:
        holderId = the ID of the holder to set the value
      Returns: the requested GValue, or null (see [gda.holder.Holder.getValue])
  */
  gobject.value.Value getHolderValue(string holderId)
  {
    const(GValue)* _cretval;
    const(char)* _holderId = holderId.toCString(No.Alloc);
    _cretval = gda_set_get_holder_value(cast(GdaSet*)this._cPtr, _holderId);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Finds a #GdaSetNode holding information for holder, don't modify the returned structure
  
      Params:
        holder = a #GdaHolder object
      Returns: the requested #GdaSetNode or null
  */
  gda.set_node.SetNode getNode(gda.holder.Holder holder)
  {
    GdaSetNode* _cretval;
    _cretval = gda_set_get_node(cast(GdaSet*)this._cPtr, holder ? cast(GdaHolder*)holder._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gda.set_node.SetNode(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Finds a #GdaHolder using its position
  
      Params:
        pos = the position of the requested #GdaHolder, starting at `0`
      Returns: the requested #GdaHolder or null
  */
  gda.holder.Holder getNthHolder(int pos)
  {
    GdaHolder* _cretval;
    _cretval = gda_set_get_nth_holder(cast(GdaSet*)this._cPtr, pos);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.holder.Holder)(cast(GdaHolder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finds a #GdaSetSource which contains the #GdaDataModel restricting the possible values of
      holder, don't modify the returned structure.
  
      Params:
        holder = a #GdaHolder object
      Returns: the requested #GdaSetSource or null
  */
  gda.set_source.SetSource getSource(gda.holder.Holder holder)
  {
    GdaSetSource* _cretval;
    _cretval = gda_set_get_source(cast(GdaSet*)this._cPtr, holder ? cast(GdaHolder*)holder._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gda.set_source.SetSource(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Finds the #GdaSetSource structure used in set for which model is a
      the data model (the returned structure should not be modified).
  
      Params:
        model = a #GdaDataModel object
      Returns: the requested #GdaSetSource pointer or null.
  */
  gda.set_source.SetSource getSourceForModel(gda.data_model.DataModel model)
  {
    GdaSetSource* _cretval;
    _cretval = gda_set_get_source_for_model(cast(GdaSet*)this._cPtr, model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gda.set_source.SetSource(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This method tells if all set's #GdaHolder objects are valid, and if
      they represent a valid combination of values, as defined by rules
      external to Libgda: the "validate-set" signal is emitted and if none of the signal handlers return an
      error, then the returned value is TRUE, otherwise the return value is FALSE as soon as a signal handler
      returns an error.
      Returns: TRUE if the set is valid
      Throws: [SetException]
  */
  bool isValid()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_set_is_valid(cast(GdaSet*)this._cPtr, &_err);
    if (_err)
      throw new SetException(_err);
    return _retval;
  }

  /**
      Add to set all the holders of set_to_merge.
      Note1: only the #GdaHolder of set_to_merge for which no holder in set has the same ID are merged
      Note2: all the #GdaHolder merged in set are still used by set_to_merge.
  
      Params:
        setToMerge = a #GdaSet object
  */
  void mergeWithSet(gda.set.Set setToMerge)
  {
    gda_set_merge_with_set(cast(GdaSet*)this._cPtr, setToMerge ? cast(GdaSet*)setToMerge._cPtr(No.Dup) : null);
  }

  /**
      Removes a #GdaHolder from the list of holders managed by set
  
      Params:
        holder = the #GdaHolder to remove from set
  */
  void removeHolder(gda.holder.Holder holder)
  {
    gda_set_remove_holder(cast(GdaSet*)this._cPtr, holder ? cast(GdaHolder*)holder._cPtr(No.Dup) : null);
  }

  /**
      Replaces source->data_model with model, which must have the same
      characteristics as source->data_model (same column types)
      
      Also for each #GdaHolder for which source->data_model is a source model,
      this method calls [gda.holder.Holder.setSourceModel] with model to replace
      the source by the new model
  
      Params:
        source = a pointer to a #GdaSetSource in set
        model = a #GdaDataModel
  */
  void replaceSourceModel(gda.set_source.SetSource source, gda.data_model.DataModel model)
  {
    gda_set_replace_source_model(cast(GdaSet*)this._cPtr, source ? cast(GdaSetSource*)source._cPtr(No.Dup) : null, model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Connect to `HolderAttrChanged` signal.
  
      Gets emitted when an attribute for any of the #GdaHolder objects managed by set has changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.holder.Holder holder, string attrName, gobject.value.Value attrValue, gda.set.Set set))
  
          `holder` the GdaHolder for which an attribute changed (optional)
  
          `attrName` attribute's name (optional)
  
          `attrValue` attribute's value (optional)
  
          `set` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectHolderAttrChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.holder.Holder)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gobject.value.Value)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gda.set.Set)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("holder-attr-changed", closure, after);
  }

  /**
      Connect to `HolderChanged` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.holder.Holder object, gda.set.Set set))
  
          `object`  (optional)
  
          `set` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectHolderChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.holder.Holder)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.set.Set)))
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
    return connectSignalClosure("holder-changed", closure, after);
  }

  /**
      Connect to `HolderTypeSet` signal.
  
      Gets emitted when holder in set has its type finally set, in case
        it was #GDA_TYPE_NULL
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.holder.Holder holder, gda.set.Set set))
  
          `holder` the #GdaHolder for which the #GType has been set (optional)
  
          `set` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectHolderTypeSet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.holder.Holder)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.set.Set)))
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
    return connectSignalClosure("holder-type-set", closure, after);
  }

  /**
      Connect to `PublicDataChanged` signal.
  
      Gets emitted when set's public data (#GdaSetNode, #GdaSetGroup or #GdaSetSource values) have changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.set.Set set))
  
          `set` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPublicDataChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.set.Set)))
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
    return connectSignalClosure("public-data-changed", closure, after);
  }

  /**
      Connect to `SourceModelChanged` signal.
  
      Gets emitted when the data model in source has changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(void* source, gda.set.Set set))
  
          `source` the #GdaSetSource for which the data_model attribute has changed (optional)
  
          `set` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSourceModelChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.set.Set)))
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
    return connectSignalClosure("source-model-changed", closure, after);
  }

  /**
      Connect to `ValidateHolderChange` signal.
  
      Gets emitted when a #GdaHolder's in set is going to change its value. One can connect to
        this signal to control which values holder can have (for example to implement some business rules)
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D glib.error.ErrorWrap callback(gda.holder.Holder holder, gobject.value.Value newValue, gda.set.Set set))
  
          `holder` the #GdaHolder which is going to change (optional)
  
          `newValue` the proposed new value for holder (optional)
  
          `set` the instance the signal is connected to (optional)
  
          `Returns` NULL if holder is allowed to change its value to new_value, or a #GError
            otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValidateHolderChange(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == glib.error.ErrorWrap)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.holder.Holder)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gobject.value.Value)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gda.set.Set)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(glib.error.ErrorWrap)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("validate-holder-change", closure, after);
  }

  /**
      Connect to `ValidateSet` signal.
  
      Gets emitted when [gda.set.Set.isValid] is called, use
        this signal to control which combination of values set's holder can have (for example to implement some business rules)
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D glib.error.ErrorWrap callback(gda.set.Set set))
  
          `set` the instance the signal is connected to (optional)
  
          `Returns` NULL if set's contents has been validated, or a #GError
            otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValidateSet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == glib.error.ErrorWrap)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.set.Set)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(glib.error.ErrorWrap)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("validate-set", closure, after);
  }
}

class SetException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.set.Set.errorQuark, cast(int)code, msg);
  }

  alias Code = SetError;
}
