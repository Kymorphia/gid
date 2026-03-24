/// Module for [ToolShell] interface mixin
module gtk.tool_shell_mixin;

public import gtk.tool_shell_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.size_group;
public import gtk.types;
public import pango.types;

/**
    The #GtkToolShell interface allows container widgets to provide additional
    information when embedding #GtkToolItem widgets.
*/
template ToolShellT()
{

  /**
      Retrieves the current ellipsize mode for the tool shell. Tool items must not
      call this function directly, but rely on [gtk.tool_item.ToolItem.getEllipsizeMode]
      instead.
      Returns: the current ellipsize mode of shell
  */
  override pango.types.EllipsizeMode getEllipsizeMode()
  {
    PangoEllipsizeMode _cretval;
    _cretval = gtk_tool_shell_get_ellipsize_mode(cast(GtkToolShell*)this._cPtr);
    pango.types.EllipsizeMode _retval = cast(pango.types.EllipsizeMode)_cretval;
    return _retval;
  }

  /**
      Retrieves the icon size for the tool shell. Tool items must not call this
      function directly, but rely on [gtk.tool_item.ToolItem.getIconSize] instead.
      Returns: the current size (#GtkIconSize) for icons of shell
  */
  override gtk.types.IconSize getIconSize()
  {
    GtkIconSize _cretval;
    _cretval = gtk_tool_shell_get_icon_size(cast(GtkToolShell*)this._cPtr);
    gtk.types.IconSize _retval = cast(gtk.types.IconSize)_cretval;
    return _retval;
  }

  /**
      Retrieves the current orientation for the tool shell. Tool items must not
      call this function directly, but rely on [gtk.tool_item.ToolItem.getOrientation]
      instead.
      Returns: the current orientation of shell
  */
  override gtk.types.Orientation toolShellGetOrientation()
  {
    GtkOrientation _cretval;
    _cretval = gtk_tool_shell_get_orientation(cast(GtkToolShell*)this._cPtr);
    gtk.types.Orientation _retval = cast(gtk.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Returns the relief style of buttons on shell. Tool items must not call this
      function directly, but rely on [gtk.tool_item.ToolItem.getReliefStyle] instead.
      Returns: The relief style of buttons on shell.
  */
  override gtk.types.ReliefStyle getReliefStyle()
  {
    GtkReliefStyle _cretval;
    _cretval = gtk_tool_shell_get_relief_style(cast(GtkToolShell*)this._cPtr);
    gtk.types.ReliefStyle _retval = cast(gtk.types.ReliefStyle)_cretval;
    return _retval;
  }

  /**
      Retrieves whether the tool shell has text, icons, or both. Tool items must
      not call this function directly, but rely on [gtk.tool_item.ToolItem.getToolbarStyle]
      instead.
      Returns: the current style of shell
  */
  override gtk.types.ToolbarStyle getStyle()
  {
    GtkToolbarStyle _cretval;
    _cretval = gtk_tool_shell_get_style(cast(GtkToolShell*)this._cPtr);
    gtk.types.ToolbarStyle _retval = cast(gtk.types.ToolbarStyle)_cretval;
    return _retval;
  }

  /**
      Retrieves the current text alignment for the tool shell. Tool items must not
      call this function directly, but rely on [gtk.tool_item.ToolItem.getTextAlignment]
      instead.
      Returns: the current text alignment of shell
  */
  override float getTextAlignment()
  {
    float _retval;
    _retval = gtk_tool_shell_get_text_alignment(cast(GtkToolShell*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current text orientation for the tool shell. Tool items must not
      call this function directly, but rely on [gtk.tool_item.ToolItem.getTextOrientation]
      instead.
      Returns: the current text orientation of shell
  */
  override gtk.types.Orientation getTextOrientation()
  {
    GtkOrientation _cretval;
    _cretval = gtk_tool_shell_get_text_orientation(cast(GtkToolShell*)this._cPtr);
    gtk.types.Orientation _retval = cast(gtk.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Retrieves the current text size group for the tool shell. Tool items must not
      call this function directly, but rely on [gtk.tool_item.ToolItem.getTextSizeGroup]
      instead.
      Returns: the current text size group of shell
  */
  override gtk.size_group.SizeGroup getTextSizeGroup()
  {
    GtkSizeGroup* _cretval;
    _cretval = gtk_tool_shell_get_text_size_group(cast(GtkToolShell*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.size_group.SizeGroup)(cast(GtkSizeGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Calling this function signals the tool shell that the overflow menu item for
      tool items have changed. If there is an overflow menu and if it is visible
      when this function it called, the menu will be rebuilt.
      
      Tool items must not call this function directly, but rely on
      [gtk.tool_item.ToolItem.rebuildMenu] instead.
  */
  override void rebuildMenu()
  {
    gtk_tool_shell_rebuild_menu(cast(GtkToolShell*)this._cPtr);
  }
}

template ToolShellGidBuilderT()
{
}
