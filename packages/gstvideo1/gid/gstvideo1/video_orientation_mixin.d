/// Module for [VideoOrientation] interface mixin
module gid.gstvideo1.video_orientation_mixin;

public import gid.core.basictypes;
public import gid.gstvideo1.video_orientation_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gst1.tag_list;
public import gid.gstvideo1.c.functions;
public import gid.gstvideo1.c.types;
public import gid.gstvideo1.types;

/**
    The interface allows unified access to control flipping and autocenter
    operation of video-sources or operators.
*/
template VideoOrientationT()
{


  /**
      Get the horizontal centering offset from the given object.
  
      Params:
        center = return location for the result
      Returns: true in case the element supports centering
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetHcenter`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetHcenter(out int center)
  {
    auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.video_orientation.VideoOrientation._getGType);
    if (!_klass || !_klass.getHcenter)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getHcenter(cast(GstVideoOrientation*)this._cPtr, cast(int*)&center);
    return _retval;
  }

  /**
      Get the horizontal flipping state (true for flipped) from the given object.
  
      Params:
        flip = return location for the result
      Returns: true in case the element supports flipping
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetHflip`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetHflip(out bool flip)
  {
    auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.video_orientation.VideoOrientation._getGType);
    if (!_klass || !_klass.getHflip)
      return typeof(return).init;

    bool _retval;
    gboolean _flip;
    _retval = cast(bool)_klass.getHflip(cast(GstVideoOrientation*)this._cPtr, &_flip);
    flip = cast(bool)_flip;
    return _retval;
  }

  /**
      Get the vertical centering offset from the given object.
  
      Params:
        center = return location for the result
      Returns: true in case the element supports centering
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetVcenter`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetVcenter(out int center)
  {
    auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.video_orientation.VideoOrientation._getGType);
    if (!_klass || !_klass.getVcenter)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getVcenter(cast(GstVideoOrientation*)this._cPtr, cast(int*)&center);
    return _retval;
  }

  /**
      Get the vertical flipping state (true for flipped) from the given object.
  
      Params:
        flip = return location for the result
      Returns: true in case the element supports flipping
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetVflip`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetVflip(out bool flip)
  {
    auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.video_orientation.VideoOrientation._getGType);
    if (!_klass || !_klass.getVflip)
      return typeof(return).init;

    bool _retval;
    gboolean _flip;
    _retval = cast(bool)_klass.getVflip(cast(GstVideoOrientation*)this._cPtr, &_flip);
    flip = cast(bool)_flip;
    return _retval;
  }

  /**
      Set the horizontal centering offset for the given object.
  
      Params:
        center = centering offset
      Returns: true in case the element supports centering
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetHcenter`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetHcenter(int center)
  {
    auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.video_orientation.VideoOrientation._getGType);
    if (!_klass || !_klass.setHcenter)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setHcenter(cast(GstVideoOrientation*)this._cPtr, center);
    return _retval;
  }

  /**
      Set the horizontal flipping state (true for flipped) for the given object.
  
      Params:
        flip = use flipping
      Returns: true in case the element supports flipping
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetHflip`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetHflip(bool flip)
  {
    auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.video_orientation.VideoOrientation._getGType);
    if (!_klass || !_klass.setHflip)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setHflip(cast(GstVideoOrientation*)this._cPtr, flip);
    return _retval;
  }

  /**
      Set the vertical centering offset for the given object.
  
      Params:
        center = centering offset
      Returns: true in case the element supports centering
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetVcenter`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetVcenter(int center)
  {
    auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.video_orientation.VideoOrientation._getGType);
    if (!_klass || !_klass.setVcenter)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setVcenter(cast(GstVideoOrientation*)this._cPtr, center);
    return _retval;
  }

  /**
      Set the vertical flipping state (true for flipped) for the given object.
  
      Params:
        flip = use flipping
      Returns: true in case the element supports flipping
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetVflip`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetVflip(bool flip)
  {
    auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gstvideo1.video_orientation.VideoOrientation._getGType);
    if (!_klass || !_klass.setVflip)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setVflip(cast(GstVideoOrientation*)this._cPtr, flip);
    return _retval;
  }

  /**
      Get the horizontal centering offset from the given object.
  
      Params:
        center = return location for the result
      Returns: true in case the element supports centering
  */
  override bool getHcenter(out int center) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_get_hcenter(cast(GstVideoOrientation*)this._cPtr, cast(int*)&center);
    return _retval;
  }

  /**
      Get the horizontal flipping state (true for flipped) from the given object.
  
      Params:
        flip = return location for the result
      Returns: true in case the element supports flipping
  */
  override bool getHflip(out bool flip) nothrow
  {
    bool _retval;
    gboolean _flip;
    _retval = cast(bool)gst_video_orientation_get_hflip(cast(GstVideoOrientation*)this._cPtr, &_flip);
    flip = cast(bool)_flip;
    return _retval;
  }

  /**
      Get the vertical centering offset from the given object.
  
      Params:
        center = return location for the result
      Returns: true in case the element supports centering
  */
  override bool getVcenter(out int center) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_get_vcenter(cast(GstVideoOrientation*)this._cPtr, cast(int*)&center);
    return _retval;
  }

  /**
      Get the vertical flipping state (true for flipped) from the given object.
  
      Params:
        flip = return location for the result
      Returns: true in case the element supports flipping
  */
  override bool getVflip(out bool flip) nothrow
  {
    bool _retval;
    gboolean _flip;
    _retval = cast(bool)gst_video_orientation_get_vflip(cast(GstVideoOrientation*)this._cPtr, &_flip);
    flip = cast(bool)_flip;
    return _retval;
  }

  /**
      Set the horizontal centering offset for the given object.
  
      Params:
        center = centering offset
      Returns: true in case the element supports centering
  */
  override bool setHcenter(int center) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_set_hcenter(cast(GstVideoOrientation*)this._cPtr, center);
    return _retval;
  }

  /**
      Set the horizontal flipping state (true for flipped) for the given object.
  
      Params:
        flip = use flipping
      Returns: true in case the element supports flipping
  */
  override bool setHflip(bool flip) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_set_hflip(cast(GstVideoOrientation*)this._cPtr, flip);
    return _retval;
  }

  /**
      Set the vertical centering offset for the given object.
  
      Params:
        center = centering offset
      Returns: true in case the element supports centering
  */
  override bool setVcenter(int center) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_set_vcenter(cast(GstVideoOrientation*)this._cPtr, center);
    return _retval;
  }

  /**
      Set the vertical flipping state (true for flipped) for the given object.
  
      Params:
        flip = use flipping
      Returns: true in case the element supports flipping
  */
  override bool setVflip(bool flip) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_orientation_set_vflip(cast(GstVideoOrientation*)this._cPtr, flip);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gstvideo1.video_orientation.VideoOrientation (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gstvideo1_video_orientation_VideoOrientation(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetHcenter", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetHflip", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetVcenter", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetVflip", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetHcenter", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetHflip", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetVcenter", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetVflip", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gstvideo1.video_orientation.VideoOrientation vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gstvideo1_video_orientation_VideoOrientation(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetHcenter", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_video_orientation_VideoOrientation(iface, "get_hcenter");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetHflip", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_video_orientation_VideoOrientation(iface, "get_hflip");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetVcenter", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_video_orientation_VideoOrientation(iface, "get_vcenter");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetVflip", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_video_orientation_VideoOrientation(iface, "get_vflip");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetHcenter", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_video_orientation_VideoOrientation(iface, "set_hcenter");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetHflip", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_video_orientation_VideoOrientation(iface, "set_hflip");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetVcenter", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_video_orientation_VideoOrientation(iface, "set_vcenter");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetVflip", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gstvideo1_video_orientation_VideoOrientation(iface, "set_vflip");
  }

  private static void _installIfaceVfunc_gid_gstvideo1_video_orientation_VideoOrientation(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GstVideoOrientationInterface*)iface;

    switch (vfunc)
    {
      case "get_hcenter":
      {
        static extern(C) gboolean _vfuncGetHcenterTramp(GstVideoOrientation* videoOrientation, int* center) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoOrientation);
          if (!_obj)
          {
            auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoOrientation), gid.gstvideo1.video_orientation.VideoOrientation._getGType);
            if (_klass && _klass.getHcenter)
              return (cast(typeof(&_vfuncGetHcenterTramp))_klass.getHcenter)(videoOrientation, center);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGetHcenter(*center);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_orientation.VideoOrientation.vfuncGetHcenter");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getHcenter = cast(typeof(_klass.getHcenter))&_vfuncGetHcenterTramp;
        break;
      }
      case "get_hflip":
      {
        static extern(C) gboolean _vfuncGetHflipTramp(GstVideoOrientation* videoOrientation, gboolean* flip) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoOrientation);
          if (!_obj)
          {
            auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoOrientation), gid.gstvideo1.video_orientation.VideoOrientation._getGType);
            if (_klass && _klass.getHflip)
              return (cast(typeof(&_vfuncGetHflipTramp))_klass.getHflip)(videoOrientation, flip);
            return typeof(return).init;
          }

          bool _dretval;
          bool _flip;

          try
          {
            _dretval = _obj.vfuncGetHflip(_flip);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_orientation.VideoOrientation.vfuncGetHflip");
          }
          auto _retval = cast(gboolean)_dretval;
          *flip = _flip;

          return _retval;
        }

        _klass.getHflip = cast(typeof(_klass.getHflip))&_vfuncGetHflipTramp;
        break;
      }
      case "get_vcenter":
      {
        static extern(C) gboolean _vfuncGetVcenterTramp(GstVideoOrientation* videoOrientation, int* center) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoOrientation);
          if (!_obj)
          {
            auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoOrientation), gid.gstvideo1.video_orientation.VideoOrientation._getGType);
            if (_klass && _klass.getVcenter)
              return (cast(typeof(&_vfuncGetVcenterTramp))_klass.getVcenter)(videoOrientation, center);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGetVcenter(*center);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_orientation.VideoOrientation.vfuncGetVcenter");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getVcenter = cast(typeof(_klass.getVcenter))&_vfuncGetVcenterTramp;
        break;
      }
      case "get_vflip":
      {
        static extern(C) gboolean _vfuncGetVflipTramp(GstVideoOrientation* videoOrientation, gboolean* flip) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoOrientation);
          if (!_obj)
          {
            auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoOrientation), gid.gstvideo1.video_orientation.VideoOrientation._getGType);
            if (_klass && _klass.getVflip)
              return (cast(typeof(&_vfuncGetVflipTramp))_klass.getVflip)(videoOrientation, flip);
            return typeof(return).init;
          }

          bool _dretval;
          bool _flip;

          try
          {
            _dretval = _obj.vfuncGetVflip(_flip);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_orientation.VideoOrientation.vfuncGetVflip");
          }
          auto _retval = cast(gboolean)_dretval;
          *flip = _flip;

          return _retval;
        }

        _klass.getVflip = cast(typeof(_klass.getVflip))&_vfuncGetVflipTramp;
        break;
      }
      case "set_hcenter":
      {
        static extern(C) gboolean _vfuncSetHcenterTramp(GstVideoOrientation* videoOrientation, int center) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoOrientation);
          if (!_obj)
          {
            auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoOrientation), gid.gstvideo1.video_orientation.VideoOrientation._getGType);
            if (_klass && _klass.setHcenter)
              return (cast(typeof(&_vfuncSetHcenterTramp))_klass.setHcenter)(videoOrientation, center);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetHcenter(center);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_orientation.VideoOrientation.vfuncSetHcenter");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setHcenter = cast(typeof(_klass.setHcenter))&_vfuncSetHcenterTramp;
        break;
      }
      case "set_hflip":
      {
        static extern(C) gboolean _vfuncSetHflipTramp(GstVideoOrientation* videoOrientation, gboolean flip) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoOrientation);
          if (!_obj)
          {
            auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoOrientation), gid.gstvideo1.video_orientation.VideoOrientation._getGType);
            if (_klass && _klass.setHflip)
              return (cast(typeof(&_vfuncSetHflipTramp))_klass.setHflip)(videoOrientation, flip);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetHflip(cast(bool)flip);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_orientation.VideoOrientation.vfuncSetHflip");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setHflip = cast(typeof(_klass.setHflip))&_vfuncSetHflipTramp;
        break;
      }
      case "set_vcenter":
      {
        static extern(C) gboolean _vfuncSetVcenterTramp(GstVideoOrientation* videoOrientation, int center) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoOrientation);
          if (!_obj)
          {
            auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoOrientation), gid.gstvideo1.video_orientation.VideoOrientation._getGType);
            if (_klass && _klass.setVcenter)
              return (cast(typeof(&_vfuncSetVcenterTramp))_klass.setVcenter)(videoOrientation, center);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetVcenter(center);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_orientation.VideoOrientation.vfuncSetVcenter");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setVcenter = cast(typeof(_klass.setVcenter))&_vfuncSetVcenterTramp;
        break;
      }
      case "set_vflip":
      {
        static extern(C) gboolean _vfuncSetVflipTramp(GstVideoOrientation* videoOrientation, gboolean flip) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoOrientation);
          if (!_obj)
          {
            auto _klass = cast(GstVideoOrientationInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoOrientation), gid.gstvideo1.video_orientation.VideoOrientation._getGType);
            if (_klass && _klass.setVflip)
              return (cast(typeof(&_vfuncSetVflipTramp))_klass.setVflip)(videoOrientation, flip);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetVflip(cast(bool)flip);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_orientation.VideoOrientation.vfuncSetVflip");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setVflip = cast(typeof(_klass.setVflip))&_vfuncSetVflipTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_orientation.VideoOrientation]
template VideoOrientationGidBuilderT()
{
}
