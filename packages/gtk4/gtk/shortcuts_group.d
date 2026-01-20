/// Module for [ShortcutsGroup] class
module gtk.shortcuts_group;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.shortcuts_shortcut;
import gtk.size_group;
import gtk.types;

/**
    A [gtk.shortcuts_group.ShortcutsGroup] represents a group of related keyboard shortcuts
    or gestures.
    
    The group has a title. It may optionally be associated with a view
    of the application, which can be used to show only relevant shortcuts
    depending on the application context.
    
    This widget is only meant to be used with [gtk.shortcuts_window.ShortcutsWindow].
    
    The recommended way to construct a [gtk.shortcuts_group.ShortcutsGroup] is with
    [gtk.builder.Builder], by using the `<child>` tag to populate a
    [gtk.shortcuts_group.ShortcutsGroup] with one or more [gtk.shortcuts_shortcut.ShortcutsShortcut]
    instances.
    
    If you need to add a shortcut programmatically, use
    [gtk.shortcuts_group.ShortcutsGroup.addShortcut].
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
          
          This is used internally by GTK, and must not be modified by applications.
  */
  @property void accelSizeGroup(gtk.size_group.SizeGroup propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.size_group.SizeGroup)("accel-size-group", propval);
  }

  /**
      Get `height` property.
      Returns: A rough measure for the number of lines in this group.
        
        This is used internally by GTK, and is not useful for applications.
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
          
          This is used internally by GTK, and must not be modified by applications.
  */
  @property void titleSizeGroup(gtk.size_group.SizeGroup propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.size_group.SizeGroup)("title-size-group", propval);
  }

  /**
      Get `view` property.
      Returns: An optional view that the shortcuts in this group are relevant for.
        
        The group will be hidden if the `property@Gtk.ShortcutsWindow:view-name`
        property does not match the view of this group.
        
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
          
          The group will be hidden if the `property@Gtk.ShortcutsWindow:view-name`
          property does not match the view of this group.
          
          Set this to null to make the group always visible.
  */
  @property void view(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("view", propval);
  }

  /**
      Adds a shortcut to the shortcuts group.
      
      This is the programmatic equivalent to using [gtk.builder.Builder] and a
      `<child>` tag to add the child. Adding children with other API is not
      appropriate as [gtk.shortcuts_group.ShortcutsGroup] manages its children internally.
  
      Params:
        shortcut = the [gtk.shortcuts_shortcut.ShortcutsShortcut] to add
  */
  void addShortcut(gtk.shortcuts_shortcut.ShortcutsShortcut shortcut)
  {
    gtk_shortcuts_group_add_shortcut(cast(GtkShortcutsGroup*)this._cPtr, shortcut ? cast(GtkShortcutsShortcut*)shortcut._cPtr(No.Dup) : null);
  }
}
