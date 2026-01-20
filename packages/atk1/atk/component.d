/// Module for [Component] interface
module atk.component;

public import atk.component_iface_proxy;
import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    The ATK interface provided by UI components
    which occupy a physical area on the screen.
    which the user can activate/interact with.
    
    #AtkComponent should be implemented by most if not all UI elements
    with an actual on-screen presence, i.e. components which can be
    said to have a screen-coordinate bounding box.  Virtually all
    widgets will need to have #AtkComponent implementations provided
    for their corresponding #AtkObject class.  In short, only UI
    elements which are *not* GUI elements will omit this ATK interface.
    
    A possible exception might be textual information with a
    transparent background, in which case text glyph bounding box
    information is provided by #AtkText.
*/
interface Component
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_component_get_type != &gidSymbolNotFound ? atk_component_get_type() : cast(GType)0;
  }

  /**
      Checks whether the specified point is within the extent of the component.
      
      Toolkit implementor note: ATK provides a default implementation for
      this virtual method. In general there are little reason to
      re-implement it.
  
      Params:
        x = x coordinate
        y = y coordinate
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
      Returns: true or false indicating whether the specified point is within
        the extent of the component or not
  */
  bool contains(int x, int y, atk.types.CoordType coordType);

  /**
      Returns the alpha value (i.e. the opacity) for this
      component, on a scale from 0 (fully transparent) to 1.0
      (fully opaque).
      Returns: An alpha value from 0 to 1.0, inclusive.
  */
  double getAlpha();

  /**
      Gets the rectangle which gives the extent of the component.
      
      If the extent can not be obtained (e.g. a non-embedded plug or missing
      support), all of x, y, width, height are set to -1.
  
      Params:
        x = address of #gint to put x coordinate
        y = address of #gint to put y coordinate
        width = address of #gint to put width
        height = address of #gint to put height
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
  */
  void getExtents(out int x, out int y, out int width, out int height, atk.types.CoordType coordType);

  /**
      Gets the layer of the component.
      Returns: an #AtkLayer which is the layer of the component
  */
  atk.types.Layer getLayer();

  /**
      Gets the zorder of the component. The value G_MININT will be returned
      if the layer of the component is not ATK_LAYER_MDI or ATK_LAYER_WINDOW.
      Returns: a gint which is the zorder of the component, i.e. the depth at
        which the component is shown in relation to other components in the same
        container.
  */
  int getMdiZorder();

  /**
      Gets the position of component in the form of
      a point specifying component's top-left corner.
      
      If the position can not be obtained (e.g. a non-embedded plug or missing
      support), x and y are set to -1.
  
      Params:
        x = address of #gint to put x coordinate position
        y = address of #gint to put y coordinate position
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
  
      Deprecated: Since 2.12. Use [atk.component.Component.getExtents] instead.
  */
  void getPosition(out int x, out int y, atk.types.CoordType coordType);

  /**
      Gets the size of the component in terms of width and height.
      
      If the size can not be obtained (e.g. a non-embedded plug or missing
      support), width and height are set to -1.
  
      Params:
        width = address of #gint to put width of component
        height = address of #gint to put height of component
  
      Deprecated: Since 2.12. Use [atk.component.Component.getExtents] instead.
  */
  void getSize(out int width, out int height);

  /**
      Grabs focus for this component.
      Returns: true if successful, false otherwise.
  */
  bool grabFocus();

  /**
      Gets a reference to the accessible child, if one exists, at the
      coordinate point specified by `x` and `y`.
  
      Params:
        x = x coordinate
        y = y coordinate
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
      Returns: a reference to the accessible
        child, if one exists
  */
  atk.object.ObjectWrap refAccessibleAtPoint(int x, int y, atk.types.CoordType coordType);

  /**
      Remove the handler specified by handler_id from the list of
      functions to be executed when this object receives focus events
      (in or out).
  
      Params:
        handlerId = the handler id of the focus handler to be removed
          from component
  
      Deprecated: If you need to track when an object gains or
        lose the focus, use the #AtkObject::state-change "focused" notification instead.
  */
  void removeFocusHandler(uint handlerId);

  /**
      Makes component visible on the screen by scrolling all necessary parents.
      
      Contrary to atk_component_set_position, this does not actually move
      component in its parent, this only makes the parents scroll so that the
      object shows up on the screen, given its current position within the parents.
  
      Params:
        type = specify where the object should be made visible.
      Returns: whether scrolling was successful.
  */
  bool scrollTo(atk.types.ScrollType type);

  /**
      Move the top-left of component to a given position of the screen by
      scrolling all necessary parents.
  
      Params:
        coords = specify whether coordinates are relative to the screen or to the
          parent object.
        x = x-position where to scroll to
        y = y-position where to scroll to
      Returns: whether scrolling was successful.
  */
  bool scrollToPoint(atk.types.CoordType coords, int x, int y);

  /**
      Sets the extents of component.
  
      Params:
        x = x coordinate
        y = y coordinate
        width = width to set for component
        height = height to set for component
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
      Returns: true or false whether the extents were set or not
  */
  bool setExtents(int x, int y, int width, int height, atk.types.CoordType coordType);

  /**
      Sets the position of component.
      
      Contrary to atk_component_scroll_to, this does not trigger any scrolling,
      this just moves component in its parent.
  
      Params:
        x = x coordinate
        y = y coordinate
        coordType = specifies whether the coordinates are relative to the screen
          or to the component's top level window
      Returns: true or false whether or not the position was set or not
  */
  bool setPosition(int x, int y, atk.types.CoordType coordType);

  /**
      Set the size of the component in terms of width and height.
  
      Params:
        width = width to set for component
        height = height to set for component
      Returns: true or false whether the size was set or not
  */
  bool setSize(int width, int height);

  /**
      Connect to `BoundsChanged` signal.
  
      The 'bounds-changed" signal is emitted when the position or
        size of the component changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.types.Rectangle arg1, atk.component.Component component))
  
          `arg1` The AtkRectangle giving the new position and size. (optional)
  
          `component` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBoundsChanged(T)(T callback, Flag!"After" after = No.After);
}
