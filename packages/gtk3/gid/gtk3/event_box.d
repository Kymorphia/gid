/// Module for [EventBox] class
module gid.gtk3.event_box;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.bin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    The #GtkEventBox widget is a subclass of #GtkBin which also has its
    own window. It is useful since it allows you to catch events for widgets
    which do not have their own window.
*/
@gidGir("EventBox", "EventBoxClass")
class EventBox : gid.gtk3.bin.Bin
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_event_box_get_type != &gidSymbolNotFound ? gtk_event_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEventBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override EventBox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.event_box.EventBox]
      Returns: New builder object
  */
  static EventBoxGidBuilder builder() nothrow
  {
    return new EventBoxGidBuilder;
  }

  /** */
  @property bool aboveChild() nothrow
  {
    return getAboveChild();
  }

  /** */
  @property void aboveChild(bool propval) nothrow
  {
    setAboveChild(propval);
  }

  /** */
  @property bool visibleWindow() nothrow
  {
    return getVisibleWindow();
  }

  /** */
  @property void visibleWindow(bool propval) nothrow
  {
    setVisibleWindow(propval);
  }

  /**
      Creates a new #GtkEventBox.
      Returns: a new #GtkEventBox
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_event_box_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Returns whether the event box window is above or below the
      windows of its child. See [gid.gtk3.event_box.EventBox.setAboveChild]
      for details.
      Returns: true if the event box window is above the
            window of its child
  */
  bool getAboveChild() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_event_box_get_above_child(cast(GtkEventBox*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the event box has a visible window.
      See [gid.gtk3.event_box.EventBox.setVisibleWindow] for details.
      Returns: true if the event box window is visible
  */
  bool getVisibleWindow() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_event_box_get_visible_window(cast(GtkEventBox*)this._cPtr);
    return _retval;
  }

  /**
      Set whether the event box window is positioned above the windows
      of its child, as opposed to below it. If the window is above, all
      events inside the event box will go to the event box. If the window
      is below, events in windows of child widgets will first got to that
      widget, and then to its parents.
      
      The default is to keep the window below the child.
  
      Params:
        aboveChild = true if the event box window is above its child
  */
  void setAboveChild(bool aboveChild) nothrow
  {
    gtk_event_box_set_above_child(cast(GtkEventBox*)this._cPtr, aboveChild);
  }

  /**
      Set whether the event box uses a visible or invisible child
      window. The default is to use visible windows.
      
      In an invisible window event box, the window that the
      event box creates is a [gid.gdk3.types.WindowWindowClass.InputOnly] window, which
      means that it is invisible and only serves to receive
      events.
      
      A visible window event box creates a visible ([gid.gdk3.types.WindowWindowClass.InputOutput])
      window that acts as the parent window for all the widgets
      contained in the event box.
      
      You should generally make your event box invisible if
      you just want to trap events. Creating a visible window
      may cause artifacts that are visible to the user, especially
      if the user is using a theme with gradients or pixmaps.
      
      The main reason to create a non input-only event box is if
      you want to set the background to a different color or
      draw on it.
      
      There is one unexpected issue for an invisible event box that has its
      window below the child. (See [gid.gtk3.event_box.EventBox.setAboveChild].)
      Since the input-only window is not an ancestor window of any windows
      that descendent widgets of the event box create, events on these
      windows aren’t propagated up by the windowing system, but only by GTK+.
      The practical effect of this is if an event isn’t in the event
      mask for the descendant window (see [gid.gtk3.widget.Widget.addEvents]),
      it won’t be received by the event box.
      
      This problem doesn’t occur for visible event boxes, because in
      that case, the event box window is actually the ancestor of the
      descendant windows, not just at the same place on the screen.
  
      Params:
        visibleWindow = true to make the event box have a visible window
  */
  void setVisibleWindow(bool visibleWindow) nothrow
  {
    gtk_event_box_set_visible_window(cast(GtkEventBox*)this._cPtr, visibleWindow);
  }
}

/// Fluent builder implementation template for [gid.gtk3.event_box.EventBox]
class EventBoxGidBuilderImpl(T) : gid.gtk3.bin.BinGidBuilderImpl!T
{


  /** */
  T aboveChild(bool propval) nothrow
  {
    return setProperty("above-child", propval);
  }

  /** */
  T visibleWindow(bool propval) nothrow
  {
    return setProperty("visible-window", propval);
  }
}

/// Fluent builder for [gid.gtk3.event_box.EventBox]
final class EventBoxGidBuilder : EventBoxGidBuilderImpl!EventBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EventBox build() nothrow
  {
    return new EventBox(cast(void*)createGObject(EventBox._getGType), Yes.Take);
  }
}
