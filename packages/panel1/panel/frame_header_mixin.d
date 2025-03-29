module panel.frame_header_mixin;

public import panel.frame_header_iface_proxy;
public import gid.gid;
public import gobject.object;
public import gtk.widget;
public import panel.c.functions;
public import panel.c.types;
public import panel.frame;
public import panel.types;
public import panel.widget;

/**
    An interface implemented by the header of a #PanelFrame.
*/
template FrameHeaderT()
{

  /**
      Add a widget into a the prefix area with a priority. The highest
      the priority the closest to the start.
  
      Params:
        priority = the priority
        child = a #GtkWidget
  */
  override void addPrefix(int priority, gtk.widget.Widget child)
  {
    panel_frame_header_add_prefix(cast(PanelFrameHeader*)cPtr, priority, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Add a widget into a the suffix area with a priority. The highest
      the priority the closest to the start.
  
      Params:
        priority = the priority
        child = a #GtkWidget
  */
  override void addSuffix(int priority, gtk.widget.Widget child)
  {
    panel_frame_header_add_suffix(cast(PanelFrameHeader*)cPtr, priority, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Tells if the panel widget can be drop onto the panel frame.
  
      Params:
        widget = a #PanelWidget
      Returns: whether the widget can be dropped.
  */
  override bool canDrop(panel.widget.Widget widget)
  {
    bool _retval;
    _retval = panel_frame_header_can_drop(cast(PanelFrameHeader*)cPtr, widget ? cast(PanelWidget*)widget.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the frame the header is attached to.
      Returns: a #PanelFrame or null
  */
  override panel.frame.Frame getFrame()
  {
    PanelFrame* _cretval;
    _cretval = panel_frame_header_get_frame(cast(PanelFrameHeader*)cPtr);
    auto _retval = ObjectG.getDObject!(panel.frame.Frame)(cast(PanelFrame*)_cretval, No.Take);
    return _retval;
  }

  /**
      Notifies the header that the visible page has changed.
  
      Params:
        widget = a #PanelWidget or null if no page is visible
  */
  override void pageChanged(panel.widget.Widget widget = null)
  {
    panel_frame_header_page_changed(cast(PanelFrameHeader*)cPtr, widget ? cast(PanelWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Sets the frame the header is attached to.
  
      Params:
        frame = a #PanelFrame or null
  */
  override void setFrame(panel.frame.Frame frame = null)
  {
    panel_frame_header_set_frame(cast(PanelFrameHeader*)cPtr, frame ? cast(PanelFrame*)frame.cPtr(No.Dup) : null);
  }
}
