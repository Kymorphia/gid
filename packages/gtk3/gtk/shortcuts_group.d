/// Module for [ShortcutsGroup] class
module gtk.shortcuts_group;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.size_group;
import gtk.types;

/**
    A GtkShortcutsGroup represents a group of related keyboard shortcuts
    or gestures. The group has a title. It may optionally be associated with
    a view of the application, which can be used to show only relevant shortcuts
    depending on the application context.
    
    This widget is only meant to be used with #GtkShortcutsWindow.
*/
class ShortcutsGroup : gtk.box.Box
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
    return cast(void function())gtk_shortcuts_group_get_type != &gidSymbolNotFound ? gtk_shortcuts_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsGroup self()
  {
    return this;
  }

  /**
      Set `accelSizeGroup` property.
      Params:
        propval = The size group for the accelerator portion of shortcuts in this group.
          
          This is used internally by GTK+, and must not be modified by applications.
  */
  @property void accelSizeGroup(gtk.size_group.SizeGroup propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.size_group.SizeGroup)("accel-size-group", propval);
  }

  /**
      Get `height` property.
      Returns: A rough measure for the number of lines in this group.
        
        This is used internally by GTK+, and is not useful for applications.
  */
  @property uint height()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("height");
  }

  /**
      Get `title` property.
      Returns: The title for this group of shortcuts.
  */
  @property string title()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this group of shortcuts.
  */
  @property void title(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  /**
      Set `titleSizeGroup` property.
      Params:
        propval = The size group for the textual portion of shortcuts in this group.
          
          This is used internally by GTK+, and must not be modified by applications.
  */
  @property void titleSizeGroup(gtk.size_group.SizeGroup propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.size_group.SizeGroup)("title-size-group", propval);
  }

  /**
      Get `view` property.
      Returns: An optional view that the shortcuts in this group are relevant for.
        The group will be hidden if the #GtkShortcutsWindow:view-name property
        does not match the view of this group.
        
        Set this to null to make the group always visible.
  */
  @property string view()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("view");
  }

  /**
      Set `view` property.
      Params:
        propval = An optional view that the shortcuts in this group are relevant for.
          The group will be hidden if the #GtkShortcutsWindow:view-name property
          does not match the view of this group.
          
          Set this to null to make the group always visible.
  */
  @property void view(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("view", propval);
  }
}
