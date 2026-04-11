/// Module for [ToolShell] interface
module gtk.tool_shell;

public import gtk.tool_shell_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.size_group;
import gtk.types;
import pango.types;

/**
    The #GtkToolShell interface allows container widgets to provide additional
    information when embedding #GtkToolItem widgets.
*/
interface ToolShell
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tool_shell_get_type != &gidSymbolNotFound ? gtk_tool_shell_get_type() : cast(GType)0;
  }

  /**
      Retrieves the current ellipsize mode for the tool shell. Tool items must not
      call this function directly, but rely on [gtk.tool_item.ToolItem.getEllipsizeMode]
      instead.
      Returns: the current ellipsize mode of shell
  */
  pango.types.EllipsizeMode getEllipsizeMode();

  /**
      Retrieves the icon size for the tool shell. Tool items must not call this
      function directly, but rely on [gtk.tool_item.ToolItem.getIconSize] instead.
      Returns: the current size (#GtkIconSize) for icons of shell
  */
  gtk.types.IconSize getIconSize();

  /**
      Retrieves the current orientation for the tool shell. Tool items must not
      call this function directly, but rely on [gtk.tool_item.ToolItem.getOrientation]
      instead.
      Returns: the current orientation of shell
  */
  gtk.types.Orientation toolShellGetOrientation();

  /**
      Returns the relief style of buttons on shell. Tool items must not call this
      function directly, but rely on [gtk.tool_item.ToolItem.getReliefStyle] instead.
      Returns: The relief style of buttons on shell.
  */
  gtk.types.ReliefStyle getReliefStyle();

  /**
      Retrieves whether the tool shell has text, icons, or both. Tool items must
      not call this function directly, but rely on [gtk.tool_item.ToolItem.getToolbarStyle]
      instead.
      Returns: the current style of shell
  */
  gtk.types.ToolbarStyle getStyle();

  /**
      Retrieves the current text alignment for the tool shell. Tool items must not
      call this function directly, but rely on [gtk.tool_item.ToolItem.getTextAlignment]
      instead.
      Returns: the current text alignment of shell
  */
  float getTextAlignment();

  /**
      Retrieves the current text orientation for the tool shell. Tool items must not
      call this function directly, but rely on [gtk.tool_item.ToolItem.getTextOrientation]
      instead.
      Returns: the current text orientation of shell
  */
  gtk.types.Orientation getTextOrientation();

  /**
      Retrieves the current text size group for the tool shell. Tool items must not
      call this function directly, but rely on [gtk.tool_item.ToolItem.getTextSizeGroup]
      instead.
      Returns: the current text size group of shell
  */
  gtk.size_group.SizeGroup getTextSizeGroup();

  /**
      Calling this function signals the tool shell that the overflow menu item for
      tool items have changed. If there is an overflow menu and if it is visible
      when this function it called, the menu will be rebuilt.
      
      Tool items must not call this function directly, but rely on
      [gtk.tool_item.ToolItem.rebuildMenu] instead.
  */
  void rebuildMenu();
}

/// Fluent builder implementation template for [gtk.tool_shell.ToolShell]
interface ToolShellGidBuilderImpl(T)
{
}
