/// Module for [ToolShell] interface
module gid.gtk3.tool_shell;

public import gid.core.basictypes;
public import gid.gtk3.tool_shell_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.size_group;
import gid.gtk3.types;
import gid.pango1.types;

/**
    The #GtkToolShell interface allows container widgets to provide additional
    information when embedding #GtkToolItem widgets.
*/
@gidGir("ToolShell", "ToolShellIface")
interface ToolShell : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tool_shell_get_type != &gidSymbolNotFound ? gtk_tool_shell_get_type() : cast(GType)0;
  }










  /**
      Retrieves the current ellipsize mode for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getEllipsizeMode]
      instead.
      Returns: the current ellipsize mode of shell
  */
  gid.pango1.types.EllipsizeMode getEllipsizeMode();

  /**
      Retrieves the icon size for the tool shell. Tool items must not call this
      function directly, but rely on [gid.gtk3.tool_item.ToolItem.getIconSize] instead.
      Returns: the current size (#GtkIconSize) for icons of shell
  */
  gid.gtk3.types.IconSize getIconSize();

  /**
      Retrieves the current orientation for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getOrientation]
      instead.
      Returns: the current orientation of shell
  */
  gid.gtk3.types.Orientation toolShellGetOrientation();

  /**
      Returns the relief style of buttons on shell. Tool items must not call this
      function directly, but rely on [gid.gtk3.tool_item.ToolItem.getReliefStyle] instead.
      Returns: The relief style of buttons on shell.
  */
  gid.gtk3.types.ReliefStyle getReliefStyle();

  /**
      Retrieves whether the tool shell has text, icons, or both. Tool items must
      not call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getToolbarStyle]
      instead.
      Returns: the current style of shell
  */
  gid.gtk3.types.ToolbarStyle getStyle();

  /**
      Retrieves the current text alignment for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getTextAlignment]
      instead.
      Returns: the current text alignment of shell
  */
  float getTextAlignment();

  /**
      Retrieves the current text orientation for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getTextOrientation]
      instead.
      Returns: the current text orientation of shell
  */
  gid.gtk3.types.Orientation getTextOrientation();

  /**
      Retrieves the current text size group for the tool shell. Tool items must not
      call this function directly, but rely on [gid.gtk3.tool_item.ToolItem.getTextSizeGroup]
      instead.
      Returns: the current text size group of shell
  */
  gid.gtk3.size_group.SizeGroup getTextSizeGroup();

  /**
      Calling this function signals the tool shell that the overflow menu item for
      tool items have changed. If there is an overflow menu and if it is visible
      when this function it called, the menu will be rebuilt.
      
      Tool items must not call this function directly, but rely on
      [gid.gtk3.tool_item.ToolItem.rebuildMenu] instead.
  */
  void rebuildMenu();
}

/// Fluent builder implementation template for [gid.gtk3.tool_shell.ToolShell]
interface ToolShellGidBuilderImpl(T)
{
}
