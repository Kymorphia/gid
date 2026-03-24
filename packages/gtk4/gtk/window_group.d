/// Module for [WindowGroup] class
module gtk.window_group;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    [gtk.window_group.WindowGroup] makes group of windows behave like separate applications.
    
    It achieves this by limiting the effect of GTK grabs and modality
    to windows in the same group.
    
    A window can be a member in at most one window group at a time.
    Windows that have not been explicitly assigned to a group are
    implicitly treated like windows of the default window group.
    
    [gtk.window_group.WindowGroup] objects are referenced by each window in the group,
    so once you have added all windows to a [gtk.window_group.WindowGroup], you can drop
    the initial reference to the window group with [gobject.object.ObjectWrap.unref]. If the
    windows in the window group are subsequently destroyed, then they will
    be removed from the window group and drop their references on the window
    group; when all window have been removed, the window group will be
    freed.
*/
class WindowGroup : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_window_group_get_type != &gidSymbolNotFound ? gtk_window_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WindowGroup self()
  {
    return this;
  }

  /**
  Get builder for [gtk.window_group.WindowGroup]
  Returns: New builder object
  */
  static WindowGroupGidBuilder builder()
  {
    return new WindowGroupGidBuilder;
  }

  /**
      Creates a new [gtk.window_group.WindowGroup] object.
      
      Modality of windows only affects windows
      within the same [gtk.window_group.WindowGroup].
      Returns: a new [gtk.window_group.WindowGroup].
  */
  this()
  {
    GtkWindowGroup* _cretval;
    _cretval = gtk_window_group_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a window to a [gtk.window_group.WindowGroup].
  
      Params:
        window = the [gtk.window.Window] to add
  */
  void addWindow(gtk.window.Window window)
  {
    gtk_window_group_add_window(cast(GtkWindowGroup*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Returns a list of the `GtkWindows` that belong to window_group.
      Returns: A
          newly-allocated list of windows inside the group.
  */
  gtk.window.Window[] listWindows()
  {
    GList* _cretval;
    _cretval = gtk_window_group_list_windows(cast(GtkWindowGroup*)this._cPtr);
    auto _retval = gListToD!(gtk.window.Window, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Removes a window from a [gtk.window_group.WindowGroup].
  
      Params:
        window = the [gtk.window.Window] to remove
  */
  void removeWindow(gtk.window.Window window)
  {
    gtk_window_group_remove_window(cast(GtkWindowGroup*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }
}

class WindowGroupGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.window_group.WindowGroup]
final class WindowGroupGidBuilder : WindowGroupGidBuilderImpl!WindowGroupGidBuilder
{
  WindowGroup build()
  {
    return new WindowGroup(cast(void*)createGObject(WindowGroup._getGType), Yes.Take);
  }
}
