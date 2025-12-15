/// Module for [Popup] interface mixin
module gdk.popup_mixin;

public import gdk.popup_iface_proxy;
public import gdk.c.functions;
public import gdk.c.types;
public import gdk.popup_layout;
public import gdk.surface;
public import gdk.types;
public import gid.gid;
public import gobject.object;

/**
    A [gdk.popup.Popup] is a surface that is attached to another surface.
    
    The [gdk.popup.Popup] is positioned relative to its parent surface.
    
    [gdk.popup.Popup]s are typically used to implement menus and similar popups.
    They can be modal, which is indicated by the [gdk.popup.Popup.autohide]
    property.
*/
template PopupT()
{

  /**
      Returns whether this popup is set to hide on outside clicks.
      Returns: true if popup will autohide
  */
  override bool getAutohide()
  {
    bool _retval;
    _retval = cast(bool)gdk_popup_get_autohide(cast(GdkPopup*)this._cPtr);
    return _retval;
  }

  /**
      Returns the parent surface of a popup.
      Returns: the parent surface
  */
  override gdk.surface.Surface getParent()
  {
    GdkSurface* _cretval;
    _cretval = gdk_popup_get_parent(cast(GdkPopup*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the position of the popup relative to its parent.
      Returns: the X coordinate of popup position
  */
  override int getPositionX()
  {
    int _retval;
    _retval = gdk_popup_get_position_x(cast(GdkPopup*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the position of the popup relative to its parent.
      Returns: the Y coordinate of popup position
  */
  override int getPositionY()
  {
    int _retval;
    _retval = gdk_popup_get_position_y(cast(GdkPopup*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current popup rectangle anchor.
      
      The value returned may change after calling [gdk.popup.Popup.present],
      or after the [gdk.surface.Surface.layout] signal is emitted.
      Returns: the current rectangle anchor value of popup
  */
  override gdk.types.Gravity getRectAnchor()
  {
    GdkGravity _cretval;
    _cretval = gdk_popup_get_rect_anchor(cast(GdkPopup*)this._cPtr);
    gdk.types.Gravity _retval = cast(gdk.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Gets the current popup surface anchor.
      
      The value returned may change after calling [gdk.popup.Popup.present],
      or after the [gdk.surface.Surface.layout] signal is emitted.
      Returns: the current surface anchor value of popup
  */
  override gdk.types.Gravity getSurfaceAnchor()
  {
    GdkGravity _cretval;
    _cretval = gdk_popup_get_surface_anchor(cast(GdkPopup*)this._cPtr);
    gdk.types.Gravity _retval = cast(gdk.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Present popup after having processed the [gdk.popup_layout.PopupLayout] rules.
      
      If the popup was previously now showing, it will be showed,
      otherwise it will change position according to layout.
      
      After calling this function, the result should be handled in response
      to the [gdk.surface.Surface.layout] signal being emitted. The resulting
      popup position can be queried using [gdk.popup.Popup.getPositionX],
      [gdk.popup.Popup.getPositionY], and the resulting size will be sent as
      parameters in the layout signal. Use [gdk.popup.Popup.getRectAnchor]
      and [gdk.popup.Popup.getSurfaceAnchor] to get the resulting anchors.
      
      Presenting may fail, for example if the popup is set to autohide
      and is immediately hidden upon being presented. If presenting failed,
      the [gdk.surface.Surface.layout] signal will not me emitted.
  
      Params:
        width = the unconstrained popup width to layout
        height = the unconstrained popup height to layout
        layout = the [gdk.popup_layout.PopupLayout] object used to layout
      Returns: false if it failed to be presented, otherwise true.
  */
  override bool present(int width, int height, gdk.popup_layout.PopupLayout layout)
  {
    bool _retval;
    _retval = cast(bool)gdk_popup_present(cast(GdkPopup*)this._cPtr, width, height, layout ? cast(GdkPopupLayout*)layout._cPtr(No.Dup) : null);
    return _retval;
  }
}
