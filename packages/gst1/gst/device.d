module gst.device;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.element;
import gst.object;
import gst.structure;
import gst.types;

/**
    #GstDevice are objects representing a device, they contain
  relevant metadata about the device, such as its class and the #GstCaps
  representing the media types it can produce or handle.
  
  #GstDevice are created by #GstDeviceProvider objects which can be
  aggregated by #GstDeviceMonitor objects.
*/
class Device : gst.object.ObjectGst
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_device_get_type != &gidSymbolNotFound ? gst_device_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Device self()
  {
    return this;
  }

  /**
      Creates the element with all of the required parameters set to use
    this device.
    Params:
      name =       name of new element, or null to automatically
        create a unique name.
    Returns:     a new #GstElement configured to use
      this device
  */
  gst.element.Element createElement(string name = null)
  {
    GstElement* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_device_create_element(cast(GstDevice*)cPtr, _name);
    auto _retval = ObjectG.getDObject!(gst.element.Element)(cast(GstElement*)_cretval, No.Take);
    return _retval;
  }

  /**
      Getter for the #GstCaps that this device supports.
    Returns:     The #GstCaps supported by this device. Unref with
      gst_caps_unref() when done.
  */
  gst.caps.Caps getCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_device_get_caps(cast(GstDevice*)cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the "class" of a device. This is a "/" separated list of
    classes that represent this device. They are a subset of the
    classes of the #GstDeviceProvider that produced this device.
    Returns:     The device class. Free with [glib.global.gfree] after use.
  */
  string getDeviceClass()
  {
    char* _cretval;
    _cretval = gst_device_get_device_class(cast(GstDevice*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the user-friendly name of the device.
    Returns:     The device name. Free with [glib.global.gfree] after use.
  */
  string getDisplayName()
  {
    char* _cretval;
    _cretval = gst_device_get_display_name(cast(GstDevice*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the extra properties of a device.
    Returns:     The extra properties or null when there are none.
               Free with [gst.structure.Structure.free] after use.
  */
  gst.structure.Structure getProperties()
  {
    GstStructure* _cretval;
    _cretval = gst_device_get_properties(cast(GstDevice*)cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Check if device matches all of the given classes
    Params:
      classes =       a "/"-separated list of device classes to match, only match if
         all classes are matched
    Returns:     true if device matches.
  */
  bool hasClasses(string classes)
  {
    bool _retval;
    const(char)* _classes = classes.toCString(No.Alloc);
    _retval = gst_device_has_classes(cast(GstDevice*)cPtr, _classes);
    return _retval;
  }

  /**
      Check if factory matches all of the given classes
    Params:
      classes =       a null terminated array of classes
          to match, only match if all classes are matched
    Returns:     true if device matches.
  */
  bool hasClassesv(string[] classes)
  {
    bool _retval;
    char*[] _tmpclasses;
    foreach (s; classes)
      _tmpclasses ~= s.toCString(No.Alloc);
    _tmpclasses ~= null;
    char** _classes = _tmpclasses.ptr;
    _retval = gst_device_has_classesv(cast(GstDevice*)cPtr, _classes);
    return _retval;
  }

  /**
      Tries to reconfigure an existing element to use the device. If this
    function fails, then one must destroy the element and create a new one
    using [gst.device.Device.createElement].
    
    Note: This should only be implemented for elements can change their
    device in the PLAYING state.
    Params:
      element =       a #GstElement
    Returns:     true if the element could be reconfigured to use this device,
      false otherwise.
  */
  bool reconfigureElement(gst.element.Element element)
  {
    bool _retval;
    _retval = gst_device_reconfigure_element(cast(GstDevice*)cPtr, element ? cast(GstElement*)element.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  alias RemovedCallbackDlg = void delegate(gst.device.Device device);

  /** ditto */
  alias RemovedCallbackFunc = void function(gst.device.Device device);

  /**
    Connect to Removed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RemovedCallbackDlg) || is(T : RemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto device = getVal!(gst.device.Device)(_paramVals);
      _dClosure.dlg(device);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("removed", closure, after);
  }
}
