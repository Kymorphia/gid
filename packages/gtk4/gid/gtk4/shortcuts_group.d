/// Module for [ShortcutsGroup] class
module gid.gtk4.shortcuts_group;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.box;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.shortcuts_shortcut;
import gid.gtk4.size_group;
import gid.gtk4.types;

/**
    A [gid.gtk4.shortcuts_group.ShortcutsGroup] represents a group of related keyboard shortcuts
    or gestures.
    
    The group has a title. It may optionally be associated with a view
    of the application, which can be used to show only relevant shortcuts
    depending on the application context.
    
    This widget is only meant to be used with [gid.gtk4.shortcuts_window.ShortcutsWindow].
    
    The recommended way to construct a [gid.gtk4.shortcuts_group.ShortcutsGroup] is with
    [gid.gtk4.builder.Builder], by using the `<child>` tag to populate a
    [gid.gtk4.shortcuts_group.ShortcutsGroup] with one or more [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut]
    instances.
    
    If you need to add a shortcut programmatically, use
    [gid.gtk4.shortcuts_group.ShortcutsGroup.addShortcut].

    Deprecated: This widget will be removed in GTK 5
*/
@gidGir("ShortcutsGroup", "ShortcutsGroupClass")
class ShortcutsGroup : gid.gtk4.box.Box
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcuts_group_get_type != &gidSymbolNotFound ? gtk_shortcuts_group_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkShortcutsGroup";
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsGroup self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.shortcuts_group.ShortcutsGroup]
      Returns: New builder object
  */
  static ShortcutsGroupGidBuilder builder() nothrow
  {
    return new ShortcutsGroupGidBuilder;
  }

  /**
      Set `accelSizeGroup` property.
      Params:
        propval = The size group for the accelerator portion of shortcuts in this group.
          
          This is used internally by GTK, and must not be modified by applications.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void accelSizeGroup(gid.gtk4.size_group.SizeGroup propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.size_group.SizeGroup)("accel-size-group", propval);
  }

  /**
      Get `height` property.
      Returns: A rough measure for the number of lines in this group.
        
        This is used internally by GTK, and is not useful for applications.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property uint height() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("height");
  }

  /**
      Get `title` property.
      Returns: The title for this group of shortcuts.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string title() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this group of shortcuts.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void title(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  /**
      Set `titleSizeGroup` property.
      Params:
        propval = The size group for the textual portion of shortcuts in this group.
          
          This is used internally by GTK, and must not be modified by applications.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void titleSizeGroup(gid.gtk4.size_group.SizeGroup propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.size_group.SizeGroup)("title-size-group", propval);
  }

  /**
      Get `view` property.
      Returns: An optional view that the shortcuts in this group are relevant for.
        
        The group will be hidden if the [gid.gtk4.shortcuts_window.ShortcutsWindow.viewName]
        property does not match the view of this group.
        
        Set this to null to make the group always visible.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string view() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("view");
  }

  /**
      Set `view` property.
      Params:
        propval = An optional view that the shortcuts in this group are relevant for.
          
          The group will be hidden if the [gid.gtk4.shortcuts_window.ShortcutsWindow.viewName]
          property does not match the view of this group.
          
          Set this to null to make the group always visible.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void view(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("view", propval);
  }

  /**
      Adds a shortcut to the shortcuts group.
      
      This is the programmatic equivalent to using [gid.gtk4.builder.Builder] and a
      `<child>` tag to add the child. Adding children with other API is not
      appropriate as [gid.gtk4.shortcuts_group.ShortcutsGroup] manages its children internally.
  
      Params:
        shortcut = the [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut] to add
  
      Deprecated: This widget will be removed in GTK 5
  */
  void addShortcut(gid.gtk4.shortcuts_shortcut.ShortcutsShortcut shortcut) nothrow
  {
    gtk_shortcuts_group_add_shortcut(cast(GtkShortcutsGroup*)this._cPtr, shortcut ? cast(GtkShortcutsShortcut*)shortcut._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.shortcuts_group.ShortcutsGroup]
class ShortcutsGroupGidBuilderImpl(T) : gid.gtk4.box.BoxGidBuilderImpl!T
{


  /**
      Set `accelSizeGroup` property.
      Params:
        propval = The size group for the accelerator portion of shortcuts in this group.
          
          This is used internally by GTK, and must not be modified by applications.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T accelSizeGroup(gid.gtk4.size_group.SizeGroup propval) nothrow
  {
    return setProperty("accel-size-group", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this group of shortcuts.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `titleSizeGroup` property.
      Params:
        propval = The size group for the textual portion of shortcuts in this group.
          
          This is used internally by GTK, and must not be modified by applications.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T titleSizeGroup(gid.gtk4.size_group.SizeGroup propval) nothrow
  {
    return setProperty("title-size-group", propval);
  }

  /**
      Set `view` property.
      Params:
        propval = An optional view that the shortcuts in this group are relevant for.
          
          The group will be hidden if the [gid.gtk4.shortcuts_window.ShortcutsWindow.viewName]
          property does not match the view of this group.
          
          Set this to null to make the group always visible.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T view(string propval) nothrow
  {
    return setProperty("view", propval);
  }
}

/// Fluent builder for [gid.gtk4.shortcuts_group.ShortcutsGroup]
final class ShortcutsGroupGidBuilder : ShortcutsGroupGidBuilderImpl!ShortcutsGroupGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShortcutsGroup build() nothrow
  {
    return new ShortcutsGroup(cast(void*)createGObject(ShortcutsGroup._getGType), Yes.Take);
  }
}
