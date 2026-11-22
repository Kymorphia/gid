/// Module for [FrameHeader] interface
module gid.panel1.frame_header;

public import gid.core.basictypes;
public import gid.panel1.frame_header_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.widget;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.frame;
import gid.panel1.types;
import gid.panel1.widget;

/**
    An interface implemented by the header of a #PanelFrame.
*/
interface FrameHeader : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())panel_frame_header_get_type != &gidSymbolNotFound ? panel_frame_header_get_type() : cast(GType)0;
  }

  /**
      Get `frame` property.
      Returns: The frame the header is attached to, or null.
  */
  @property gid.panel1.frame.Frame frame() nothrow;

  /**
      Set `frame` property.
      Params:
        propval = The frame the header is attached to, or null.
  */
  @property void frame(gid.panel1.frame.Frame propval) nothrow;

  /**
      Add a widget into a the prefix area with a priority. The highest
      the priority the closest to the start.
  
      Params:
        priority = the priority
        child = a #GtkWidget
  */
  void addPrefix(int priority, gid.gtk4.widget.Widget child);

  /**
      Add a widget into a the suffix area with a priority. The highest
      the priority the closest to the start.
  
      Params:
        priority = the priority
        child = a #GtkWidget
  */
  void addSuffix(int priority, gid.gtk4.widget.Widget child);

  /**
      Tells if the panel widget can be drop onto the panel frame.
  
      Params:
        widget = a #PanelWidget
      Returns: whether the widget can be dropped.
  */
  bool canDrop(gid.panel1.widget.Widget widget);

  /**
      Gets the frame the header is attached to.
      Returns: a #PanelFrame or null
  */
  gid.panel1.frame.Frame getFrame();

  /**
      Notifies the header that the visible page has changed.
  
      Params:
        widget = a #PanelWidget or null if no page is visible
  */
  void pageChanged(gid.panel1.widget.Widget widget = null);

  /**
      Sets the frame the header is attached to.
  
      Params:
        frame = a #PanelFrame or null
  */
  void setFrame(gid.panel1.frame.Frame frame = null);
}

/// Fluent builder implementation template for [gid.panel1.frame_header.FrameHeader]
interface FrameHeaderGidBuilderImpl(T)
{

  /**
      Set `frame` property.
      Params:
        propval = The frame the header is attached to, or null.
      Returns: Builder instance for fluent chaining
  */
  T frame(gid.panel1.frame.Frame propval) nothrow;
}
