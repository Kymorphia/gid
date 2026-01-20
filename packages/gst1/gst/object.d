/// Module for [ObjectWrap] class
module gst.object;

import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.initially_unowned;
import gobject.object;
import gobject.param_spec;
import gobject.value;
import gst.c.functions;
import gst.c.types;
import gst.control_binding;
import gst.types;

/**
    #GstObject provides a root for the object hierarchy tree filed in by the
    GStreamer library.  It is currently a thin wrapper on top of
    #GInitiallyUnowned. It is an abstract class that is not very usable on its own.
    
    #GstObject gives us basic refcounting, parenting functionality and locking.
    Most of the functions are just extended for special GStreamer needs and can be
    found under the same name in the base class of #GstObject which is #GObject
    (e.g. [gobject.object.ObjectWrap.ref_] becomes [gst.object.ObjectWrap.ref_]).
    
    Since #GstObject derives from #GInitiallyUnowned, it also inherits the
    floating reference. Be aware that functions such as [gst.bin.Bin.add] and
    [gst.element.Element.addPad] take ownership of the floating reference.
    
    In contrast to #GObject instances, #GstObject adds a name property. The functions
    [gst.object.ObjectWrap.setName] and [gst.object.ObjectWrap.getName] are used to set/get the name
    of the object.
    
    ## controlled properties
    
    Controlled properties offers a lightweight way to adjust gobject properties
    over stream-time. It works by using time-stamped value pairs that are queued
    for element-properties. At run-time the elements continuously pull value
    changes for the current stream-time.
    
    What needs to be changed in a #GstElement?
    Very little - it is just two steps to make a plugin controllable!
    
      $(LIST
          * mark gobject-properties paramspecs that make sense to be controlled,
            by GST_PARAM_CONTROLLABLE.
        
          * when processing data (get, chain, loop function) at the beginning call
            gst_object_sync_values(element,timestamp).
            This will make the controller update all GObject properties that are
            under its control with the current values based on the timestamp.
      )
        
    What needs to be done in applications? Again it's not a lot to change.
    
      $(LIST
          * create a #GstControlSource.
            csource = gst_interpolation_control_source_new ();
            g_object_set (csource, "mode", GST_INTERPOLATION_MODE_LINEAR, NULL);
        
          * Attach the #GstControlSource on the controller to a property.
            gst_object_add_control_binding (object, gst_direct_control_binding_new (object, "prop1", csource));
        
          * Set the control values
            gst_timed_value_control_source_set ((GstTimedValueControlSource *)csource,0 * GST_SECOND, value1);
            gst_timed_value_control_source_set ((GstTimedValueControlSource *)csource,1 * GST_SECOND, value2);
        
          * start your pipeline
      )
*/
class ObjectWrap : gobject.initially_unowned.InitiallyUnowned
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
    return cast(void function())gst_object_get_type != &gidSymbolNotFound ? gst_object_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ObjectWrap self()
  {
    return this;
  }

  /** */
  @property string name()
  {
    return getName();
  }

  /** */
  @property void name(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("name", propval);
  }

  /**
      Get `parent` property.
      Returns: The parent of the object. Please note, that when changing the 'parent'
        property, we don't emit #GObject::notify and #GstObject::deep-notify
        signals due to locking issues. In some cases one can use
        #GstBin::element-added or #GstBin::element-removed signals on the parent to
        achieve a similar effect.
  */
  @property gst.object.ObjectWrap parent()
  {
    return getParent();
  }

  /**
      Set `parent` property.
      Params:
        propval = The parent of the object. Please note, that when changing the 'parent'
          property, we don't emit #GObject::notify and #GstObject::deep-notify
          signals due to locking issues. In some cases one can use
          #GstBin::element-added or #GstBin::element-removed signals on the parent to
          achieve a similar effect.
  */
  @property void parent(gst.object.ObjectWrap propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.object.ObjectWrap)("parent", propval);
  }

  /**
      Checks to see if there is any object named name in list. This function
      does not do any locking of any kind. You might want to protect the
      provided list with the lock of the owner of the list. This function
      will lock each #GstObject in the list to compare the name, so be
      careful when passing a list with a locked object.
  
      Params:
        list = a list of #GstObject to
               check through
        name = the name to search for
      Returns: true if a #GstObject named name does not appear in list,
        false if it does.
        
        MT safe. Grabs and releases the LOCK of each object in the list.
  */
  static bool checkUniqueness(gst.object.ObjectWrap[] list, string name)
  {
    bool _retval;
    auto _list = gListFromD!(gst.object.ObjectWrap)(list);
    scope(exit) containerFree!(GList*, gst.object.ObjectWrap, GidOwnership.None)(_list);
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gst_object_check_uniqueness(_list, _name);
    return _retval;
  }

  /**
      A default deep_notify signal callback for an object. The user data
      should contain a pointer to an array of strings that should be excluded
      from the notify. The default handler will print the new value of the property
      using g_print.
      
      MT safe. This function grabs and releases object's LOCK for getting its
               path string.
  
      Params:
        object = the #GObject that signalled the notify.
        orig = a #GstObject that initiated the notify.
        pspec = a #GParamSpec of the property.
        excludedProps = a set of user-specified properties to exclude or null to show
              all changes.
  */
  static void defaultDeepNotify(gobject.object.ObjectWrap object, gst.object.ObjectWrap orig, gobject.param_spec.ParamSpec pspec, string[] excludedProps = null)
  {
    char*[] _tmpexcludedProps;
    foreach (s; excludedProps)
      _tmpexcludedProps ~= s.toCString(No.Alloc);
    _tmpexcludedProps ~= null;
    char** _excludedProps = _tmpexcludedProps.ptr;

    gst_object_default_deep_notify(object ? cast(GObject*)object._cPtr(No.Dup) : null, orig ? cast(GstObject*)orig._cPtr(No.Dup) : null, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, _excludedProps);
  }

  /**
      Atomically modifies a pointer to point to a new object.
      The reference count of oldobj is decreased and the reference count of
      newobj is increased.
      
      Either newobj and the value pointed to by oldobj may be null.
  
      Params:
        oldobj = pointer to a place of
              a #GstObject to replace
        newobj = a new #GstObject
      Returns: true if newobj was different from oldobj
  */
  static bool replace(gst.object.ObjectWrap oldobj = null, gst.object.ObjectWrap newobj = null)
  {
    bool _retval;
    _retval = cast(bool)gst_object_replace(oldobj ? cast(GstObject**)oldobj._cPtr(No.Dup) : null, newobj ? cast(GstObject*)newobj._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Attach the #GstControlBinding to the object. If there already was a
      #GstControlBinding for this property it will be replaced.
      
      The object's reference count will be incremented, and any floating
      reference will be removed (see [gst.object.ObjectWrap.refSink])
  
      Params:
        binding = the #GstControlBinding that should be used
      Returns: false if the given binding has not been setup for this object or
        has been setup for a non suitable property, true otherwise.
  */
  bool addControlBinding(gst.control_binding.ControlBinding binding)
  {
    bool _retval;
    _retval = cast(bool)gst_object_add_control_binding(cast(GstObject*)this._cPtr, binding ? cast(GstControlBinding*)binding._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A default error function that uses [glib.global.printerr] to display the error message
      and the optional debug string..
      
      The default handler will simply print the error string using g_print.
  
      Params:
        error = the GError.
        debug_ = an additional debug information string, or null
  */
  void defaultError(glib.error.ErrorWrap error, string debug_ = null)
  {
    const(char)* _debug_ = debug_.toCString(No.Alloc);
    gst_object_default_error(cast(GstObject*)this._cPtr, error ? cast(const(GError)*)error._cPtr : null, _debug_);
  }

  /**
      Gets the corresponding #GstControlBinding for the property. This should be
      unreferenced again after use.
  
      Params:
        propertyName = name of the property
      Returns: the #GstControlBinding for
        property_name or null if the property is not controlled.
  */
  gst.control_binding.ControlBinding getControlBinding(string propertyName)
  {
    GstControlBinding* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = gst_object_get_control_binding(cast(GstObject*)this._cPtr, _propertyName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.control_binding.ControlBinding)(cast(GstControlBinding*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtain the control-rate for this object. Audio processing #GstElement
      objects will use this rate to sub-divide their processing loop and call
      [gst.object.ObjectWrap.syncValues] in between. The length of the processing segment
      should be up to control-rate nanoseconds.
      
      If the object is not under property control, this will return
      `GST_CLOCK_TIME_NONE`. This allows the element to avoid the sub-dividing.
      
      The control-rate is not expected to change if the element is in
      [gst.types.State.Paused] or [gst.types.State.Playing].
      Returns: the control rate in nanoseconds
  */
  gst.types.ClockTime getControlRate()
  {
    gst.types.ClockTime _retval;
    _retval = gst_object_get_control_rate(cast(GstObject*)this._cPtr);
    return _retval;
  }

  /**
      Gets a number of #GValues for the given controlled property starting at the
      requested time. The array values need to hold enough space for n_values of
      #GValue.
      
      This function is useful if one wants to e.g. draw a graph of the control
      curve or apply a control curve sample by sample.
  
      Params:
        propertyName = the name of the property to get
        timestamp = the time that should be processed
        interval = the time spacing between subsequent values
        values = array to put control-values in
      Returns: true if the given array could be filled, false otherwise
  */
  bool getGValueArray(string propertyName, gst.types.ClockTime timestamp, gst.types.ClockTime interval, gobject.value.Value[] values)
  {
    bool _retval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    uint _nValues;
    if (values)
      _nValues = cast(uint)values.length;

    GValue[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= *cast(GValue*)obj._cPtr;
    GValue* _values = _tmpvalues.ptr;

    _retval = cast(bool)gst_object_get_g_value_array(cast(GstObject*)this._cPtr, _propertyName, timestamp, interval, _nValues, _values);
    return _retval;
  }

  /**
      Returns a copy of the name of object.
      Caller should [glib.global.gfree] the return value after usage.
      For a nameless object, this returns null, which you can safely [glib.global.gfree]
      as well.
      
      Free-function: g_free
      Returns: the name of object. [glib.global.gfree]
        after usage.
        
        MT safe. This function grabs and releases object's LOCK.
  */
  string getName()
  {
    char* _cretval;
    _cretval = gst_object_get_name(cast(GstObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the parent of object. This function increases the refcount
      of the parent object so you should [gst.object.ObjectWrap.unref] it after usage.
      Returns: parent of object, this can be
          null if object has no parent. unref after usage.
        
        MT safe. Grabs and releases object's LOCK.
  */
  gst.object.ObjectWrap getParent()
  {
    GstObject* _cretval;
    _cretval = gst_object_get_parent(cast(GstObject*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.object.ObjectWrap)(cast(GstObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Generates a string describing the path of object in
      the object hierarchy. Only useful (or used) for debugging.
      
      Free-function: g_free
      Returns: a string describing the path of object. You must
                 [glib.global.gfree] the string after usage.
        
        MT safe. Grabs and releases the #GstObject's LOCK for all objects
                 in the hierarchy.
  */
  string getPathString()
  {
    char* _cretval;
    _cretval = gst_object_get_path_string(cast(GstObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the value for the given controlled property at the requested time.
  
      Params:
        propertyName = the name of the property to get
        timestamp = the time the control-change should be read from
      Returns: the GValue of the property at the given time,
        or null if the property isn't controlled.
  */
  gobject.value.Value getValue(string propertyName, gst.types.ClockTime timestamp)
  {
    GValue* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = gst_object_get_value(cast(GstObject*)this._cPtr, _propertyName, timestamp);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Check if the object has active controlled properties.
      Returns: true if the object has active controlled properties
  */
  bool hasActiveControlBindings()
  {
    bool _retval;
    _retval = cast(bool)gst_object_has_active_control_bindings(cast(GstObject*)this._cPtr);
    return _retval;
  }

  /**
      Check if object has an ancestor ancestor somewhere up in
      the hierarchy. One can e.g. check if a #GstElement is inside a #GstPipeline.
  
      Params:
        ancestor = a #GstObject to check as ancestor
      Returns: true if ancestor is an ancestor of object.
  
      Deprecated: Use [gst.object.ObjectWrap.hasAsAncestor] instead.
        
        MT safe. Grabs and releases object's locks.
  */
  bool hasAncestor(gst.object.ObjectWrap ancestor)
  {
    bool _retval;
    _retval = cast(bool)gst_object_has_ancestor(cast(GstObject*)this._cPtr, ancestor ? cast(GstObject*)ancestor._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Check if object has an ancestor ancestor somewhere up in
      the hierarchy. One can e.g. check if a #GstElement is inside a #GstPipeline.
  
      Params:
        ancestor = a #GstObject to check as ancestor
      Returns: true if ancestor is an ancestor of object.
        
        MT safe. Grabs and releases object's locks.
  */
  bool hasAsAncestor(gst.object.ObjectWrap ancestor)
  {
    bool _retval;
    _retval = cast(bool)gst_object_has_as_ancestor(cast(GstObject*)this._cPtr, ancestor ? cast(GstObject*)ancestor._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Check if parent is the parent of object.
      E.g. a #GstElement can check if it owns a given #GstPad.
  
      Params:
        parent = a #GstObject to check as parent
      Returns: false if either object or parent is null. true if parent is
                 the parent of object. Otherwise false.
        
        MT safe. Grabs and releases object's locks.
  */
  bool hasAsParent(gst.object.ObjectWrap parent)
  {
    bool _retval;
    _retval = cast(bool)gst_object_has_as_parent(cast(GstObject*)this._cPtr, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes the corresponding #GstControlBinding. If it was the
      last ref of the binding, it will be disposed.
  
      Params:
        binding = the binding
      Returns: true if the binding could be removed.
  */
  bool removeControlBinding(gst.control_binding.ControlBinding binding)
  {
    bool _retval;
    _retval = cast(bool)gst_object_remove_control_binding(cast(GstObject*)this._cPtr, binding ? cast(GstControlBinding*)binding._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This function is used to disable the control bindings on a property for
      some time, i.e. [gst.object.ObjectWrap.syncValues] will do nothing for the
      property.
  
      Params:
        propertyName = property to disable
        disabled = boolean that specifies whether to disable the controller
          or not.
  */
  void setControlBindingDisabled(string propertyName, bool disabled)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    gst_object_set_control_binding_disabled(cast(GstObject*)this._cPtr, _propertyName, disabled);
  }

  /**
      This function is used to disable all controlled properties of the object for
      some time, i.e. [gst.object.ObjectWrap.syncValues] will do nothing.
  
      Params:
        disabled = boolean that specifies whether to disable the controller
          or not.
  */
  void setControlBindingsDisabled(bool disabled)
  {
    gst_object_set_control_bindings_disabled(cast(GstObject*)this._cPtr, disabled);
  }

  /**
      Change the control-rate for this object. Audio processing #GstElement
      objects will use this rate to sub-divide their processing loop and call
      [gst.object.ObjectWrap.syncValues] in between. The length of the processing segment
      should be up to control-rate nanoseconds.
      
      The control-rate should not change if the element is in [gst.types.State.Paused] or
      [gst.types.State.Playing].
  
      Params:
        controlRate = the new control-rate in nanoseconds.
  */
  void setControlRate(gst.types.ClockTime controlRate)
  {
    gst_object_set_control_rate(cast(GstObject*)this._cPtr, controlRate);
  }

  /**
      Sets the name of object, or gives object a guaranteed unique
      name (if name is null).
      This function makes a copy of the provided name, so the caller
      retains ownership of the name it sent.
  
      Params:
        name = new name of object
      Returns: true if the name could be set. Since Objects that have
        a parent cannot be renamed, this function returns false in those
        cases.
        
        MT safe.  This function grabs and releases object's LOCK.
  */
  bool setName(string name = null)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gst_object_set_name(cast(GstObject*)this._cPtr, _name);
    return _retval;
  }

  /**
      Sets the parent of object to parent. The object's reference count will
      be incremented, and any floating reference will be removed (see [gst.object.ObjectWrap.refSink]).
  
      Params:
        parent = new parent of object
      Returns: true if parent could be set or false when object
        already had a parent or object and parent are the same.
        
        MT safe. Grabs and releases object's LOCK.
  */
  bool setParent(gst.object.ObjectWrap parent)
  {
    bool _retval;
    _retval = cast(bool)gst_object_set_parent(cast(GstObject*)this._cPtr, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns a suggestion for timestamps where buffers should be split
      to get best controller results.
      Returns: Returns the suggested timestamp or `GST_CLOCK_TIME_NONE`
        if no control-rate was set.
  */
  gst.types.ClockTime suggestNextSync()
  {
    gst.types.ClockTime _retval;
    _retval = gst_object_suggest_next_sync(cast(GstObject*)this._cPtr);
    return _retval;
  }

  /**
      Sets the properties of the object, according to the #GstControlSources that
      (maybe) handle them and for the given timestamp.
      
      If this function fails, it is most likely the application developers fault.
      Most probably the control sources are not setup correctly.
  
      Params:
        timestamp = the time that should be processed
      Returns: true if the controller values could be applied to the object
        properties, false otherwise
  */
  bool syncValues(gst.types.ClockTime timestamp)
  {
    bool _retval;
    _retval = cast(bool)gst_object_sync_values(cast(GstObject*)this._cPtr, timestamp);
    return _retval;
  }

  /**
      Clear the parent of object, removing the associated reference.
      This function decreases the refcount of object.
      
      MT safe. Grabs and releases object's lock.
  */
  void unparent()
  {
    gst_object_unparent(cast(GstObject*)this._cPtr);
  }

  /**
      Connect to `DeepNotify` signal.
  
      The deep notify signal is used to be notified of property changes. It is
        typically attached to the toplevel bin to receive notifications from all
        the elements contained in that bin.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.object.ObjectWrap propObject, gobject.param_spec.ParamSpec prop, gst.object.ObjectWrap objectWrap))
  
          `propObject` the object that originated the signal (optional)
  
          `prop` the property that changed (optional)
  
          `objectWrap` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeepNotify(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gobject.param_spec.ParamSpec)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gst.object.ObjectWrap)))
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
    return connectSignalClosure("deep-notify"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
