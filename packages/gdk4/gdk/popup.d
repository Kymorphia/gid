/// Module for [Popup] interface
module gdk.popup;

public import gdk.popup_iface_proxy;
import gdk.c.functions;
import gdk.c.types;
import gdk.popup_layout;
import gdk.surface;
import gdk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    A [gdk.popup.Popup] is a surface that is attached to another surface.
    
    The [gdk.popup.Popup] is positioned relative to its parent surface.
    
    [gdk.popup.Popup]s are typically used to implement menus and similar popups.
    They can be modal, which is indicated by the [gdk.popup.Popup.autohide]
    property.
*/
interface Popup
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_popup_get_type != &gidSymbolNotFound ? gdk_popup_get_type() : cast(GType)0;
  }

  /**
      Get `autohide` property.
      Returns: Whether to hide on outside clicks.
  */
  @property bool autohide();

  /**
      Get `parent` property.
      Returns: The parent surface.
  */
  @property gdk.surface.Surface parent();

  /**
      Returns whether this popup is set to hide on outside clicks.
      Returns: true if popup will autohide
  */
  bool getAutohide();

  /**
      Returns the parent surface of a popup.
      Returns: the parent surface
  */
  gdk.surface.Surface getParent();

  /**
      Obtains the position of the popup relative to its parent.
      Returns: the X coordinate of popup position
  */
  int getPositionX();

  /**
      Obtains the position of the popup relative to its parent.
      Returns: the Y coordinate of popup position
  */
  int getPositionY();

  /**
      Gets the current popup rectangle anchor.
      
      The value returned may change after calling [gdk.popup.Popup.present],
      or after the [gdk.surface.Surface.layout] signal is emitted.
      Returns: the current rectangle anchor value of popup
  */
  gdk.types.Gravity getRectAnchor();

  /**
      Gets the current popup surface anchor.
      
      The value returned may change after calling [gdk.popup.Popup.present],
      or after the [gdk.surface.Surface.layout] signal is emitted.
      Returns: the current surface anchor value of popup
  */
  gdk.types.Gravity getSurfaceAnchor();

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
  bool present(int width, int height, gdk.popup_layout.PopupLayout layout);
}

/// Fluent builder implementation template for [gdk.popup.Popup]
interface PopupGidBuilderImpl(T)
{

  /**
      Set `autohide` property.
      Params:
        propval = Whether to hide on outside clicks.
      Returns: Builder instance for fluent chaining
  */
  T autohide(bool propval);

  /**
      Set `parent` property.
      Params:
        propval = The parent surface.
      Returns: Builder instance for fluent chaining
  */
  T parent(gdk.surface.Surface propval);
}
