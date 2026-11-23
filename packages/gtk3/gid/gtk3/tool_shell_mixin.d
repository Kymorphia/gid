/// Module for [ToolShell] interface mixin
module gid.gtk3.tool_shell_mixin;

public import gid.core.basictypes;
public import gid.gtk3.tool_shell_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.size_group;
public import gid.gtk3.types;
public import gid.pango1.types;

/**
    The #GtkToolShell interface allows container widgets to provide additional
    information when embedding #GtkToolItem widgets.
*/
template ToolShellT()
{

  /**
      Retrieves the current ellipsize mode for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getEllipsizeMode]
      instead.
      Returns: the current ellipsize mode of shell
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetEllipsizeMode`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.pango1.types.EllipsizeMode vfuncGetEllipsizeMode()
  {
    auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tool_shell.ToolShell._getGType);
    if (!_klass || !_klass.getEllipsizeMode)
      return typeof(return).init;

    PangoEllipsizeMode _cretval;
    _cretval = _klass.getEllipsizeMode(cast(GtkToolShell*)this._cPtr);
    gid.pango1.types.EllipsizeMode _retval = cast(gid.pango1.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
      mandatory implementation of [gid.gtk3.tool_shell.ToolShell.getIconSize].
      Returns: 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIconSize`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.types.IconSize vfuncGetIconSize()
  {
    auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tool_shell.ToolShell._getGType);
    if (!_klass || !_klass.getIconSize)
      return typeof(return).init;

    GtkIconSize _cretval;
    _cretval = _klass.getIconSize(cast(GtkToolShell*)this._cPtr);
    gid.gtk3.types.IconSize _retval = cast(gid.gtk3.types.IconSize)_cretval;
    return _retval;
  }

  /**
      Retrieves the current orientation for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getOrientation]
      instead.
      Returns: the current orientation of shell
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetOrientation`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.types.Orientation vfuncGetOrientation()
  {
    auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tool_shell.ToolShell._getGType);
    if (!_klass || !_klass.getOrientation)
      return typeof(return).init;

    GtkOrientation _cretval;
    _cretval = _klass.getOrientation(cast(GtkToolShell*)this._cPtr);
    gid.gtk3.types.Orientation _retval = cast(gid.gtk3.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Returns the relief style of buttons on shell. Tool items must not call this
      function directly, but rely on [gid.gtk3.tool_item.ToolItem.getReliefStyle] instead.
      Returns: The relief style of buttons on shell.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetReliefStyle`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.types.ReliefStyle vfuncGetReliefStyle()
  {
    auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tool_shell.ToolShell._getGType);
    if (!_klass || !_klass.getReliefStyle)
      return typeof(return).init;

    GtkReliefStyle _cretval;
    _cretval = _klass.getReliefStyle(cast(GtkToolShell*)this._cPtr);
    gid.gtk3.types.ReliefStyle _retval = cast(gid.gtk3.types.ReliefStyle)_cretval;
    return _retval;
  }

  /**
      Retrieves whether the tool shell has text, icons, or both. Tool items must
      not call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getToolbarStyle]
      instead.
      Returns: the current style of shell
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetStyle`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.types.ToolbarStyle vfuncGetStyle()
  {
    auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tool_shell.ToolShell._getGType);
    if (!_klass || !_klass.getStyle)
      return typeof(return).init;

    GtkToolbarStyle _cretval;
    _cretval = _klass.getStyle(cast(GtkToolShell*)this._cPtr);
    gid.gtk3.types.ToolbarStyle _retval = cast(gid.gtk3.types.ToolbarStyle)_cretval;
    return _retval;
  }

  /**
      Retrieves the current text alignment for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getTextAlignment]
      instead.
      Returns: the current text alignment of shell
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetTextAlignment`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected float vfuncGetTextAlignment()
  {
    auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tool_shell.ToolShell._getGType);
    if (!_klass || !_klass.getTextAlignment)
      return typeof(return).init;

    float _retval;
    _retval = _klass.getTextAlignment(cast(GtkToolShell*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current text orientation for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getTextOrientation]
      instead.
      Returns: the current text orientation of shell
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetTextOrientation`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.types.Orientation vfuncGetTextOrientation()
  {
    auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tool_shell.ToolShell._getGType);
    if (!_klass || !_klass.getTextOrientation)
      return typeof(return).init;

    GtkOrientation _cretval;
    _cretval = _klass.getTextOrientation(cast(GtkToolShell*)this._cPtr);
    gid.gtk3.types.Orientation _retval = cast(gid.gtk3.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Retrieves the current text size group for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getTextSizeGroup]
      instead.
      Returns: the current text size group of shell
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetTextSizeGroup`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.size_group.SizeGroup vfuncGetTextSizeGroup()
  {
    auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tool_shell.ToolShell._getGType);
    if (!_klass || !_klass.getTextSizeGroup)
      return typeof(return).init;

    GtkSizeGroup* _cretval;
    _cretval = _klass.getTextSizeGroup(cast(GtkToolShell*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.size_group.SizeGroup)(cast(GtkSizeGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Calling this function signals the tool shell that the overflow menu item for
      tool items have changed. If there is an overflow menu and if it is visible
      when this function it called, the menu will be rebuilt.
      
      Tool items must not call this function directly, but rely on
      [gid.gtk3.tool_item.ToolItem.rebuildMenu] instead.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRebuildMenu`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRebuildMenu()
  {
    auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.tool_shell.ToolShell._getGType);
    if (!_klass || !_klass.rebuildMenu)
      return;

    _klass.rebuildMenu(cast(GtkToolShell*)this._cPtr);
  }

  /**
      Retrieves the current ellipsize mode for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getEllipsizeMode]
      instead.
      Returns: the current ellipsize mode of shell
  */
  override gid.pango1.types.EllipsizeMode getEllipsizeMode() nothrow
  {
    PangoEllipsizeMode _cretval;
    _cretval = gtk_tool_shell_get_ellipsize_mode(cast(GtkToolShell*)this._cPtr);
    gid.pango1.types.EllipsizeMode _retval = cast(gid.pango1.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
      Retrieves the icon size for the tool shell. Tool items must not call this
      function directly, but rely on [gid.gtk3.tool_item.ToolItem.getIconSize] instead.
      Returns: the current size (#GtkIconSize) for icons of shell
  */
  override gid.gtk3.types.IconSize getIconSize() nothrow
  {
    GtkIconSize _cretval;
    _cretval = gtk_tool_shell_get_icon_size(cast(GtkToolShell*)this._cPtr);
    gid.gtk3.types.IconSize _retval = cast(gid.gtk3.types.IconSize)_cretval;
    return _retval;
  }

  /**
      Retrieves the current orientation for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getOrientation]
      instead.
      Returns: the current orientation of shell
  */
  override gid.gtk3.types.Orientation toolShellGetOrientation() nothrow
  {
    GtkOrientation _cretval;
    _cretval = gtk_tool_shell_get_orientation(cast(GtkToolShell*)this._cPtr);
    gid.gtk3.types.Orientation _retval = cast(gid.gtk3.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Returns the relief style of buttons on shell. Tool items must not call this
      function directly, but rely on [gid.gtk3.tool_item.ToolItem.getReliefStyle] instead.
      Returns: The relief style of buttons on shell.
  */
  override gid.gtk3.types.ReliefStyle getReliefStyle() nothrow
  {
    GtkReliefStyle _cretval;
    _cretval = gtk_tool_shell_get_relief_style(cast(GtkToolShell*)this._cPtr);
    gid.gtk3.types.ReliefStyle _retval = cast(gid.gtk3.types.ReliefStyle)_cretval;
    return _retval;
  }

  /**
      Retrieves whether the tool shell has text, icons, or both. Tool items must
      not call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getToolbarStyle]
      instead.
      Returns: the current style of shell
  */
  override gid.gtk3.types.ToolbarStyle getStyle() nothrow
  {
    GtkToolbarStyle _cretval;
    _cretval = gtk_tool_shell_get_style(cast(GtkToolShell*)this._cPtr);
    gid.gtk3.types.ToolbarStyle _retval = cast(gid.gtk3.types.ToolbarStyle)_cretval;
    return _retval;
  }

  /**
      Retrieves the current text alignment for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getTextAlignment]
      instead.
      Returns: the current text alignment of shell
  */
  override float getTextAlignment() nothrow
  {
    float _retval;
    _retval = gtk_tool_shell_get_text_alignment(cast(GtkToolShell*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current text orientation for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getTextOrientation]
      instead.
      Returns: the current text orientation of shell
  */
  override gid.gtk3.types.Orientation getTextOrientation() nothrow
  {
    GtkOrientation _cretval;
    _cretval = gtk_tool_shell_get_text_orientation(cast(GtkToolShell*)this._cPtr);
    gid.gtk3.types.Orientation _retval = cast(gid.gtk3.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Retrieves the current text size group for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getTextSizeGroup]
      instead.
      Returns: the current text size group of shell
  */
  override gid.gtk3.size_group.SizeGroup getTextSizeGroup() nothrow
  {
    GtkSizeGroup* _cretval;
    _cretval = gtk_tool_shell_get_text_size_group(cast(GtkToolShell*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.size_group.SizeGroup)(cast(GtkSizeGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Calling this function signals the tool shell that the overflow menu item for
      tool items have changed. If there is an overflow menu and if it is visible
      when this function it called, the menu will be rebuilt.
      
      Tool items must not call this function directly, but rely on
      [gid.gtk3.tool_item.ToolItem.rebuildMenu] instead.
  */
  override void rebuildMenu() nothrow
  {
    gtk_tool_shell_rebuild_menu(cast(GtkToolShell*)this._cPtr);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.tool_shell.ToolShell (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_tool_shell_ToolShell(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetEllipsizeMode", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIconSize", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetOrientation", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetReliefStyle", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStyle", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextAlignment", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextOrientation", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextSizeGroup", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRebuildMenu", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.tool_shell.ToolShell vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_tool_shell_ToolShell(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetEllipsizeMode", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tool_shell_ToolShell(iface, "get_ellipsize_mode");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIconSize", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tool_shell_ToolShell(iface, "get_icon_size");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetOrientation", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tool_shell_ToolShell(iface, "get_orientation");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetReliefStyle", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tool_shell_ToolShell(iface, "get_relief_style");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStyle", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tool_shell_ToolShell(iface, "get_style");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextAlignment", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tool_shell_ToolShell(iface, "get_text_alignment");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextOrientation", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tool_shell_ToolShell(iface, "get_text_orientation");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetTextSizeGroup", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tool_shell_ToolShell(iface, "get_text_size_group");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRebuildMenu", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_tool_shell_ToolShell(iface, "rebuild_menu");
  }

  private static void _installIfaceVfunc_gid_gtk3_tool_shell_ToolShell(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkToolShellIface*)iface;

    switch (vfunc)
    {
      case "get_ellipsize_mode":
      {
        static extern(C) PangoEllipsizeMode _vfuncGetEllipsizeModeTramp(GtkToolShell* shell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)shell);
          if (!_obj)
          {
            auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)shell), gid.gtk3.tool_shell.ToolShell._getGType);
            if (_klass && _klass.getEllipsizeMode)
              return (cast(typeof(&_vfuncGetEllipsizeModeTramp))_klass.getEllipsizeMode)(shell);
            return typeof(return).init;
          }

          gid.pango1.types.EllipsizeMode _dretval;

          try
          {
            _dretval = _obj.vfuncGetEllipsizeMode();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tool_shell.ToolShell.vfuncGetEllipsizeMode");
          }
          auto _retval = cast(PangoEllipsizeMode)_dretval;

          return _retval;
        }

        _klass.getEllipsizeMode = cast(typeof(_klass.getEllipsizeMode))&_vfuncGetEllipsizeModeTramp;
        break;
      }
      case "get_icon_size":
      {
        static extern(C) GtkIconSize _vfuncGetIconSizeTramp(GtkToolShell* shell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)shell);
          if (!_obj)
          {
            auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)shell), gid.gtk3.tool_shell.ToolShell._getGType);
            if (_klass && _klass.getIconSize)
              return (cast(typeof(&_vfuncGetIconSizeTramp))_klass.getIconSize)(shell);
            return typeof(return).init;
          }

          gid.gtk3.types.IconSize _dretval;

          try
          {
            _dretval = _obj.vfuncGetIconSize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tool_shell.ToolShell.vfuncGetIconSize");
          }
          auto _retval = cast(GtkIconSize)_dretval;

          return _retval;
        }

        _klass.getIconSize = cast(typeof(_klass.getIconSize))&_vfuncGetIconSizeTramp;
        break;
      }
      case "get_orientation":
      {
        static extern(C) GtkOrientation _vfuncGetOrientationTramp(GtkToolShell* shell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)shell);
          if (!_obj)
          {
            auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)shell), gid.gtk3.tool_shell.ToolShell._getGType);
            if (_klass && _klass.getOrientation)
              return (cast(typeof(&_vfuncGetOrientationTramp))_klass.getOrientation)(shell);
            return typeof(return).init;
          }

          gid.gtk3.types.Orientation _dretval;

          try
          {
            _dretval = _obj.vfuncGetOrientation();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tool_shell.ToolShell.vfuncGetOrientation");
          }
          auto _retval = cast(GtkOrientation)_dretval;

          return _retval;
        }

        _klass.getOrientation = cast(typeof(_klass.getOrientation))&_vfuncGetOrientationTramp;
        break;
      }
      case "get_relief_style":
      {
        static extern(C) GtkReliefStyle _vfuncGetReliefStyleTramp(GtkToolShell* shell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)shell);
          if (!_obj)
          {
            auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)shell), gid.gtk3.tool_shell.ToolShell._getGType);
            if (_klass && _klass.getReliefStyle)
              return (cast(typeof(&_vfuncGetReliefStyleTramp))_klass.getReliefStyle)(shell);
            return typeof(return).init;
          }

          gid.gtk3.types.ReliefStyle _dretval;

          try
          {
            _dretval = _obj.vfuncGetReliefStyle();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tool_shell.ToolShell.vfuncGetReliefStyle");
          }
          auto _retval = cast(GtkReliefStyle)_dretval;

          return _retval;
        }

        _klass.getReliefStyle = cast(typeof(_klass.getReliefStyle))&_vfuncGetReliefStyleTramp;
        break;
      }
      case "get_style":
      {
        static extern(C) GtkToolbarStyle _vfuncGetStyleTramp(GtkToolShell* shell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)shell);
          if (!_obj)
          {
            auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)shell), gid.gtk3.tool_shell.ToolShell._getGType);
            if (_klass && _klass.getStyle)
              return (cast(typeof(&_vfuncGetStyleTramp))_klass.getStyle)(shell);
            return typeof(return).init;
          }

          gid.gtk3.types.ToolbarStyle _dretval;

          try
          {
            _dretval = _obj.vfuncGetStyle();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tool_shell.ToolShell.vfuncGetStyle");
          }
          auto _retval = cast(GtkToolbarStyle)_dretval;

          return _retval;
        }

        _klass.getStyle = cast(typeof(_klass.getStyle))&_vfuncGetStyleTramp;
        break;
      }
      case "get_text_alignment":
      {
        static extern(C) float _vfuncGetTextAlignmentTramp(GtkToolShell* shell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)shell);
          if (!_obj)
          {
            auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)shell), gid.gtk3.tool_shell.ToolShell._getGType);
            if (_klass && _klass.getTextAlignment)
              return (cast(typeof(&_vfuncGetTextAlignmentTramp))_klass.getTextAlignment)(shell);
            return typeof(return).init;
          }

          float _retval;

          try
          {
            _retval = _obj.vfuncGetTextAlignment();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tool_shell.ToolShell.vfuncGetTextAlignment");
          }
          return _retval;
        }

        _klass.getTextAlignment = cast(typeof(_klass.getTextAlignment))&_vfuncGetTextAlignmentTramp;
        break;
      }
      case "get_text_orientation":
      {
        static extern(C) GtkOrientation _vfuncGetTextOrientationTramp(GtkToolShell* shell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)shell);
          if (!_obj)
          {
            auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)shell), gid.gtk3.tool_shell.ToolShell._getGType);
            if (_klass && _klass.getTextOrientation)
              return (cast(typeof(&_vfuncGetTextOrientationTramp))_klass.getTextOrientation)(shell);
            return typeof(return).init;
          }

          gid.gtk3.types.Orientation _dretval;

          try
          {
            _dretval = _obj.vfuncGetTextOrientation();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tool_shell.ToolShell.vfuncGetTextOrientation");
          }
          auto _retval = cast(GtkOrientation)_dretval;

          return _retval;
        }

        _klass.getTextOrientation = cast(typeof(_klass.getTextOrientation))&_vfuncGetTextOrientationTramp;
        break;
      }
      case "get_text_size_group":
      {
        static extern(C) GtkSizeGroup* _vfuncGetTextSizeGroupTramp(GtkToolShell* shell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)shell);
          if (!_obj)
          {
            auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)shell), gid.gtk3.tool_shell.ToolShell._getGType);
            if (_klass && _klass.getTextSizeGroup)
              return (cast(typeof(&_vfuncGetTextSizeGroupTramp))_klass.getTextSizeGroup)(shell);
            return typeof(return).init;
          }

          gid.gtk3.size_group.SizeGroup _dretval;

          try
          {
            _dretval = _obj.vfuncGetTextSizeGroup();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tool_shell.ToolShell.vfuncGetTextSizeGroup");
          }
          auto _retval = _dretval ? cast(GtkSizeGroup*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getTextSizeGroup = cast(typeof(_klass.getTextSizeGroup))&_vfuncGetTextSizeGroupTramp;
        break;
      }
      case "rebuild_menu":
      {
        static extern(C) void _vfuncRebuildMenuTramp(GtkToolShell* shell) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)shell);
          if (!_obj)
          {
            auto _klass = cast(GtkToolShellIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)shell), gid.gtk3.tool_shell.ToolShell._getGType);
            if (_klass && _klass.rebuildMenu)
              return (cast(typeof(&_vfuncRebuildMenuTramp))_klass.rebuildMenu)(shell);
            return;
          }

          try
          {
            _obj.vfuncRebuildMenu();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tool_shell.ToolShell.vfuncRebuildMenu");
          }
        }

        _klass.rebuildMenu = cast(typeof(_klass.rebuildMenu))&_vfuncRebuildMenuTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.tool_shell.ToolShell]
template ToolShellGidBuilderT()
{
}
