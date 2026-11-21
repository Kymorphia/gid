/// Module for [FrameHeader] interface mixin
module gid.panel1.frame_header_mixin;

public import gid.core.basictypes;
public import gid.panel1.frame_header_iface_proxy;
public import gid.core.gid;
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
