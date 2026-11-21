/// Module for [Popup] interface mixin
module gid.gdk4.popup_mixin;

public import gid.core.basictypes;
public import gid.gdk4.popup_iface_proxy;
public import gid.core.gid;
public import gid.gdk4.c.functions;
public import gid.gdk4.c.types;
public import gid.gdk4.popup_layout;
public import gid.gdk4.surface;
public import gid.gdk4.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    A surface that is attached to another surface.
    
    The [gid.gdk4.popup.Popup] is positioned relative to its parent surface.
    
    [gid.gdk4.popup.Popup]s are typically used to implement menus and similar popups.
    They can be modal, which is indicated by the [gid.gdk4.popup.Popup.autohide]
    property.
*/
template PopupT()
{

  /**
      Get `autohide` property.
      Returns: Whether to hide on outside clicks.
  */
  @property bool autohide() nothrow
  {
    return getAutohide();
  }

  /**
      Get `parent` property.
      Returns: The parent surface.
  */
  @property gid.gdk4.surface.Surface parent() nothrow
  {
    return getParent();
  }

  /**
      Returns whether this popup is set to hide on outside clicks.
      Returns: true if popup will autohide
  */
  override bool getAutohide() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_popup_get_autohide(cast(GdkPopup*)this._cPtr);
    return _retval;
  }

  /**
      Returns the parent surface of a popup.
      Returns: the parent surface
  */
  override gid.gdk4.surface.Surface getParent() nothrow
  {
    GdkSurface* _cretval;
    _cretval = gdk_popup_get_parent(cast(GdkPopup*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the position of the popup relative to its parent.
      Returns: the X coordinate of popup position
  */
  override int getPositionX() nothrow
  {
    int _retval;
    _retval = gdk_popup_get_position_x(cast(GdkPopup*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the position of the popup relative to its parent.
      Returns: the Y coordinate of popup position
  */
  override int getPositionY() nothrow
  {
    int _retval;
    _retval = gdk_popup_get_position_y(cast(GdkPopup*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current popup rectangle anchor.
      
      The value returned may change after calling [gid.gdk4.popup.Popup.present],
      or after the [gid.gdk4.surface.Surface.layout] signal is emitted.
      Returns: the current rectangle anchor value of popup
  */
  override gid.gdk4.types.Gravity getRectAnchor() nothrow
  {
    GdkGravity _cretval;
    _cretval = gdk_popup_get_rect_anchor(cast(GdkPopup*)this._cPtr);
    gid.gdk4.types.Gravity _retval = cast(gid.gdk4.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Gets the current popup surface anchor.
      
      The value returned may change after calling [gid.gdk4.popup.Popup.present],
      or after the [gid.gdk4.surface.Surface.layout] signal is emitted.
      Returns: the current surface anchor value of popup
  */
  override gid.gdk4.types.Gravity getSurfaceAnchor() nothrow
  {
    GdkGravity _cretval;
    _cretval = gdk_popup_get_surface_anchor(cast(GdkPopup*)this._cPtr);
    gid.gdk4.types.Gravity _retval = cast(gid.gdk4.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Present popup after having processed the [gid.gdk4.popup_layout.PopupLayout] rules.
      
      If the popup was previously not showing, it will be shown,
      otherwise it will change position according to layout.
      
      After calling this function, the result should be handled in response
      to the [gid.gdk4.surface.Surface.layout] signal being emitted. The resulting
      popup position can be queried using [gid.gdk4.popup.Popup.getPositionX],
      [gid.gdk4.popup.Popup.getPositionY], and the resulting size will be sent as
      parameters in the layout signal. Use [gid.gdk4.popup.Popup.getRectAnchor]
      and [gid.gdk4.popup.Popup.getSurfaceAnchor] to get the resulting anchors.
      
      Presenting may fail, for example if the popup is set to autohide
      and is immediately hidden upon being presented. If presenting failed,
      the [gid.gdk4.surface.Surface.layout] signal will not me emitted.
  
      Params:
        width = the unconstrained popup width to layout
        height = the unconstrained popup height to layout
        layout = the [gid.gdk4.popup_layout.PopupLayout] object used to layout
      Returns: false if it failed to be presented, otherwise true.
  */
  override bool present(int width, int height, gid.gdk4.popup_layout.PopupLayout layout) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_popup_present(cast(GdkPopup*)this._cPtr, width, height, layout ? cast(GdkPopupLayout*)layout._cPtr(No.Dup) : null);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gdk4.popup.Popup]
template PopupGidBuilderT()
{

  /**
      Set `autohide` property.
      Params:
        propval = Whether to hide on outside clicks.
      Returns: Builder instance for fluent chaining
  */
  T autohide(bool propval) nothrow
  {
    return setProperty("autohide", propval);
  }

  /**
      Set `parent` property.
      Params:
        propval = The parent surface.
      Returns: Builder instance for fluent chaining
  */
  T parent(gid.gdk4.surface.Surface propval) nothrow
  {
    return setProperty("parent", propval);
  }
}
