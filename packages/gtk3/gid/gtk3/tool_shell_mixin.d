/// Module for [ToolShell] interface mixin
module gid.gtk3.tool_shell_mixin;

public import gid.core.basictypes;
public import gid.gtk3.tool_shell_iface_proxy;
public import gid.core.gid;
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
}

/// Fluent builder implementation template for [gid.gtk3.tool_shell.ToolShell]
template ToolShellGidBuilderT()
{
}
