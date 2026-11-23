/// Module for [FrameHeader] interface mixin
module gid.panel1.frame_header_mixin;

public import gid.core.basictypes;
public import gid.panel1.frame_header_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.widget;
public import gid.panel1.c.functions;
public import gid.panel1.c.types;
public import gid.panel1.frame;
public import gid.panel1.types;
public import gid.panel1.widget;

/**
    An interface implemented by the header of a #PanelFrame.
*/
template FrameHeaderT()
{

  /**
      Get `frame` property.
      Returns: The frame the header is attached to, or null.
  */
  @property gid.panel1.frame.Frame frame() nothrow
  {
    return getFrame();
  }

  /**
      Set `frame` property.
      Params:
        propval = The frame the header is attached to, or null.
  */
  @property void frame(gid.panel1.frame.Frame propval) nothrow
  {
    setFrame(propval);
  }

  /**
      Add a widget into a the prefix area with a priority. The highest
      the priority the closest to the start.
  
      Params:
        priority = the priority
        child = a #GtkWidget
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAddPrefix`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncAddPrefix(int priority, gid.gtk4.widget.Widget child)
  {
    auto _klass = cast(PanelFrameHeaderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.panel1.frame_header.FrameHeader._getGType);
    if (!_klass || !_klass.addPrefix)
      return;

    _klass.addPrefix(cast(PanelFrameHeader*)this._cPtr, priority, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Add a widget into a the suffix area with a priority. The highest
      the priority the closest to the start.
  
      Params:
        priority = the priority
        child = a #GtkWidget
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAddSuffix`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncAddSuffix(int priority, gid.gtk4.widget.Widget child)
  {
    auto _klass = cast(PanelFrameHeaderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.panel1.frame_header.FrameHeader._getGType);
    if (!_klass || !_klass.addSuffix)
      return;

    _klass.addSuffix(cast(PanelFrameHeader*)this._cPtr, priority, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Tells if the panel widget can be drop onto the panel frame.
  
      Params:
        widget = a #PanelWidget
      Returns: whether the widget can be dropped.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanDrop`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanDrop(gid.panel1.widget.Widget widget)
  {
    auto _klass = cast(PanelFrameHeaderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.panel1.frame_header.FrameHeader._getGType);
    if (!_klass || !_klass.canDrop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canDrop(cast(PanelFrameHeader*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Notifies the header that the visible page has changed.
  
      Params:
        widget = a #PanelWidget or null if no page is visible
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPageChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncPageChanged(gid.panel1.widget.Widget widget = null)
  {
    auto _klass = cast(PanelFrameHeaderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.panel1.frame_header.FrameHeader._getGType);
    if (!_klass || !_klass.pageChanged)
      return;

    _klass.pageChanged(cast(PanelFrameHeader*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Add a widget into a the prefix area with a priority. The highest
      the priority the closest to the start.
  
      Params:
        priority = the priority
        child = a #GtkWidget
  */
  override void addPrefix(int priority, gid.gtk4.widget.Widget child) nothrow
  {
    panel_frame_header_add_prefix(cast(PanelFrameHeader*)this._cPtr, priority, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Add a widget into a the suffix area with a priority. The highest
      the priority the closest to the start.
  
      Params:
        priority = the priority
        child = a #GtkWidget
  */
  override void addSuffix(int priority, gid.gtk4.widget.Widget child) nothrow
  {
    panel_frame_header_add_suffix(cast(PanelFrameHeader*)this._cPtr, priority, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Tells if the panel widget can be drop onto the panel frame.
  
      Params:
        widget = a #PanelWidget
      Returns: whether the widget can be dropped.
  */
  override bool canDrop(gid.panel1.widget.Widget widget) nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_frame_header_can_drop(cast(PanelFrameHeader*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the frame the header is attached to.
      Returns: a #PanelFrame or null
  */
  override gid.panel1.frame.Frame getFrame() nothrow
  {
    PanelFrame* _cretval;
    _cretval = panel_frame_header_get_frame(cast(PanelFrameHeader*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.frame.Frame)(cast(PanelFrame*)_cretval, No.Take);
    return _retval;
  }

  /**
      Notifies the header that the visible page has changed.
  
      Params:
        widget = a #PanelWidget or null if no page is visible
  */
  override void pageChanged(gid.panel1.widget.Widget widget = null) nothrow
  {
    panel_frame_header_page_changed(cast(PanelFrameHeader*)this._cPtr, widget ? cast(PanelWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the frame the header is attached to.
  
      Params:
        frame = a #PanelFrame or null
  */
  override void setFrame(gid.panel1.frame.Frame frame = null) nothrow
  {
    panel_frame_header_set_frame(cast(PanelFrameHeader*)this._cPtr, frame ? cast(PanelFrame*)frame._cPtr(No.Dup) : null);
  }

  /// True if the D class T overrides any vfunc method of gid.panel1.frame_header.FrameHeader (DiG)
  enum bool _ifaceVfuncsOverridden_gid_panel1_frame_header_FrameHeader(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddPrefix", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddSuffix", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanDrop", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPageChanged", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.panel1.frame_header.FrameHeader vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_panel1_frame_header_FrameHeader(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddPrefix", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_panel1_frame_header_FrameHeader(iface, "add_prefix");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddSuffix", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_panel1_frame_header_FrameHeader(iface, "add_suffix");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanDrop", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_panel1_frame_header_FrameHeader(iface, "can_drop");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPageChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_panel1_frame_header_FrameHeader(iface, "page_changed");
  }

  private static void _installIfaceVfunc_gid_panel1_frame_header_FrameHeader(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(PanelFrameHeaderInterface*)iface;

    switch (vfunc)
    {
      case "add_prefix":
      {
        static extern(C) void _vfuncAddPrefixTramp(PanelFrameHeader* self, int priority, GtkWidget* child) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelFrameHeaderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.panel1.frame_header.FrameHeader._getGType);
            if (_klass && _klass.addPrefix)
              return (cast(typeof(&_vfuncAddPrefixTramp))_klass.addPrefix)(self, priority, child);
            return;
          }

          try
          {
            _obj.vfuncAddPrefix(priority, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)child, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.panel1.frame_header.FrameHeader.vfuncAddPrefix");
          }
        }

        _klass.addPrefix = cast(typeof(_klass.addPrefix))&_vfuncAddPrefixTramp;
        break;
      }
      case "add_suffix":
      {
        static extern(C) void _vfuncAddSuffixTramp(PanelFrameHeader* self, int priority, GtkWidget* child) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelFrameHeaderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.panel1.frame_header.FrameHeader._getGType);
            if (_klass && _klass.addSuffix)
              return (cast(typeof(&_vfuncAddSuffixTramp))_klass.addSuffix)(self, priority, child);
            return;
          }

          try
          {
            _obj.vfuncAddSuffix(priority, gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)child, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.panel1.frame_header.FrameHeader.vfuncAddSuffix");
          }
        }

        _klass.addSuffix = cast(typeof(_klass.addSuffix))&_vfuncAddSuffixTramp;
        break;
      }
      case "can_drop":
      {
        static extern(C) gboolean _vfuncCanDropTramp(PanelFrameHeader* self, PanelWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelFrameHeaderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.panel1.frame_header.FrameHeader._getGType);
            if (_klass && _klass.canDrop)
              return (cast(typeof(&_vfuncCanDropTramp))_klass.canDrop)(self, widget);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanDrop(gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.widget.Widget)(cast(void*)widget, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.panel1.frame_header.FrameHeader.vfuncCanDrop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canDrop = cast(typeof(_klass.canDrop))&_vfuncCanDropTramp;
        break;
      }
      case "page_changed":
      {
        static extern(C) void _vfuncPageChangedTramp(PanelFrameHeader* self, PanelWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(PanelFrameHeaderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.panel1.frame_header.FrameHeader._getGType);
            if (_klass && _klass.pageChanged)
              return (cast(typeof(&_vfuncPageChangedTramp))_klass.pageChanged)(self, widget);
            return;
          }

          try
          {
            _obj.vfuncPageChanged(gid.gobject2.object.ObjectWrap._getDObject!(gid.panel1.widget.Widget)(cast(void*)widget, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.panel1.frame_header.FrameHeader.vfuncPageChanged");
          }
        }

        _klass.pageChanged = cast(typeof(_klass.pageChanged))&_vfuncPageChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.panel1.frame_header.FrameHeader]
template FrameHeaderGidBuilderT()
{

  /**
      Set `frame` property.
      Params:
        propval = The frame the header is attached to, or null.
      Returns: Builder instance for fluent chaining
  */
  T frame(gid.panel1.frame.Frame propval) nothrow
  {
    return setProperty("frame", propval);
  }
}
