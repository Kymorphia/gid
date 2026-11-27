/// Module for [Popup] interface
module gid.gdk4.popup;

public import gid.core.basictypes;
public import gid.gdk4.popup_iface_proxy;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.popup_layout;
import gid.gdk4.surface;
import gid.gdk4.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A surface that is attached to another surface.
    
    The [gid.gdk4.popup.Popup] is positioned relative to its parent surface.
    
    [gid.gdk4.popup.Popup]s are typically used to implement menus and similar popups.
    They can be modal, which is indicated by the [gid.gdk4.popup.Popup.autohide]
    property.
*/
@gidGir("Popup", "PopupInterface")
interface Popup : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gdk_popup_get_type != &gidSymbolNotFound ? gdk_popup_get_type() : cast(GType)0;
  }

  /**
      Get `autohide` property.
      Returns: Whether to hide on outside clicks.
  */
  @property bool autohide() nothrow;

  /**
      Get `parent` property.
      Returns: The parent surface.
  */
  @property gid.gdk4.surface.Surface parent() nothrow;

  /**
      Returns whether this popup is set to hide on outside clicks.
      Returns: true if popup will autohide
  */
  bool getAutohide();

  /**
      Returns the parent surface of a popup.
      Returns: the parent surface
  */
  gid.gdk4.surface.Surface getParent();

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
      
      The value returned may change after calling [gid.gdk4.popup.Popup.present],
      or after the [gid.gdk4.surface.Surface.layout] signal is emitted.
      Returns: the current rectangle anchor value of popup
  */
  gid.gdk4.types.Gravity getRectAnchor();

  /**
      Gets the current popup surface anchor.
      
      The value returned may change after calling [gid.gdk4.popup.Popup.present],
      or after the [gid.gdk4.surface.Surface.layout] signal is emitted.
      Returns: the current surface anchor value of popup
  */
  gid.gdk4.types.Gravity getSurfaceAnchor();

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
  bool present(int width, int height, gid.gdk4.popup_layout.PopupLayout layout);
}

/// Fluent builder implementation template for [gid.gdk4.popup.Popup]
interface PopupGidBuilderImpl(T)
{

  /**
      Set `autohide` property.
      Params:
        propval = Whether to hide on outside clicks.
      Returns: Builder instance for fluent chaining
  */
  T autohide(bool propval) nothrow;

  /**
      Set `parent` property.
      Params:
        propval = The parent surface.
      Returns: Builder instance for fluent chaining
  */
  T parent(gid.gdk4.surface.Surface propval) nothrow;
}
