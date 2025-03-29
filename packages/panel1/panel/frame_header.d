module panel.frame_header;

public import panel.frame_header_iface_proxy;
import gid.gid;
import gobject.object;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.frame;
import panel.types;
import panel.widget;

/**
    An interface implemented by the header of a #PanelFrame.
*/
interface FrameHeader
{

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_frame_header_get_type != &gidSymbolNotFound ? panel_frame_header_get_type() : cast(GType)0;
  }

  /**
      Add a widget into a the prefix area with a priority. The highest
      the priority the closest to the start.
  
      Params:
        priority = the priority
        child = a #GtkWidget
  */
  void addPrefix(int priority, gtk.widget.Widget child);

  /**
      Add a widget into a the suffix area with a priority. The highest
      the priority the closest to the start.
  
      Params:
        priority = the priority
        child = a #GtkWidget
  */
  void addSuffix(int priority, gtk.widget.Widget child);

  /**
      Tells if the panel widget can be drop onto the panel frame.
  
      Params:
        widget = a #PanelWidget
      Returns: whether the widget can be dropped.
  */
  bool canDrop(panel.widget.Widget widget);

  /**
      Gets the frame the header is attached to.
      Returns: a #PanelFrame or null
  */
  panel.frame.Frame getFrame();

  /**
      Notifies the header that the visible page has changed.
  
      Params:
        widget = a #PanelWidget or null if no page is visible
  */
  void pageChanged(panel.widget.Widget widget = null);

  /**
      Sets the frame the header is attached to.
  
      Params:
        frame = a #PanelFrame or null
  */
  void setFrame(panel.frame.Frame frame = null);
}
