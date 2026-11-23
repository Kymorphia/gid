/// Module for [WindowGroup] class
module gid.gtk4.window_group;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.window;

/**
    Creates groups of windows that behave like separate applications.
    
    It achieves this by limiting the effect of GTK grabs and modality
    to windows in the same group.
    
    A window can be a member in at most one window group at a time.
    Windows that have not been explicitly assigned to a group are
    implicitly treated like windows of the default window group.
    
    [gid.gtk4.window_group.WindowGroup] objects are referenced by each window in the group,
    so once you have added all windows to a [gid.gtk4.window_group.WindowGroup], you can drop
    the initial reference to the window group with [gid.gobject2.object.ObjectWrap.unref]. If the
    windows in the window group are subsequently destroyed, then they will
    be removed from the window group and drop their references on the window
    group; when all window have been removed, the window group will be
    freed.
*/
class WindowGroup : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_window_group_get_type != &gidSymbolNotFound ? gtk_window_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkWindowGroup";
  }

  /** Returns `this`, for use in `with` statements. */
  override WindowGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.window_group.WindowGroup]
      Returns: New builder object
  */
  static WindowGroupGidBuilder builder() nothrow
  {
    return new WindowGroupGidBuilder;
  }

  /**
      Creates a new [gid.gtk4.window_group.WindowGroup] object.
      
      Modality of windows only affects windows
      within the same [gid.gtk4.window_group.WindowGroup].
      Returns: a new [gid.gtk4.window_group.WindowGroup].
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWindowGroup* _cretval;
      _cretval = gtk_window_group_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Adds a window to a [gid.gtk4.window_group.WindowGroup].
  
      Params:
        window = the [gid.gtk4.window.Window] to add
  */
  void addWindow(gid.gtk4.window.Window window) nothrow
  {
    gtk_window_group_add_window(cast(GtkWindowGroup*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Returns a list of the `GtkWindows` that belong to window_group.
      Returns: A
          newly-allocated list of windows inside the group.
  */
  gid.gtk4.window.Window[] listWindows() nothrow
  {
    GList* _cretval;
    _cretval = gtk_window_group_list_windows(cast(GtkWindowGroup*)this._cPtr);
    auto _retval = gListToD!(gid.gtk4.window.Window, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Removes a window from a [gid.gtk4.window_group.WindowGroup].
  
      Params:
        window = the [gid.gtk4.window.Window] to remove
  */
  void removeWindow(gid.gtk4.window.Window window) nothrow
  {
    gtk_window_group_remove_window(cast(GtkWindowGroup*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.window_group.WindowGroup]
class WindowGroupGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.window_group.WindowGroup]
final class WindowGroupGidBuilder : WindowGroupGidBuilderImpl!WindowGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WindowGroup build() nothrow
  {
    return new WindowGroup(cast(void*)createGObject(WindowGroup._getGType), Yes.Take);
  }
}
