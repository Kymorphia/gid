/// Module for [ShortcutsGroup] class
module gid.gtk3.shortcuts_group;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.box;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.size_group;
import gid.gtk3.types;

/**
    A GtkShortcutsGroup represents a group of related keyboard shortcuts
    or gestures. The group has a title. It may optionally be associated with
    a view of the application, which can be used to show only relevant shortcuts
    depending on the application context.
    
    This widget is only meant to be used with #GtkShortcutsWindow.
*/
class ShortcutsGroup : gid.gtk3.box.Box
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
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
      Get builder for [gid.gtk3.shortcuts_group.ShortcutsGroup]
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
          
          This is used internally by GTK+, and must not be modified by applications.
  */
  @property void accelSizeGroup(gid.gtk3.size_group.SizeGroup propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.size_group.SizeGroup)("accel-size-group", propval);
  }

  /**
      Get `height` property.
      Returns: A rough measure for the number of lines in this group.
        
        This is used internally by GTK+, and is not useful for applications.
  */
  @property uint height() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("height");
  }

  /**
      Get `title` property.
      Returns: The title for this group of shortcuts.
  */
  @property string title() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this group of shortcuts.
  */
  @property void title(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  /**
      Set `titleSizeGroup` property.
      Params:
        propval = The size group for the textual portion of shortcuts in this group.
          
          This is used internally by GTK+, and must not be modified by applications.
  */
  @property void titleSizeGroup(gid.gtk3.size_group.SizeGroup propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.size_group.SizeGroup)("title-size-group", propval);
  }

  /**
      Get `view` property.
      Returns: An optional view that the shortcuts in this group are relevant for.
        The group will be hidden if the #GtkShortcutsWindow:view-name property
        does not match the view of this group.
        
        Set this to null to make the group always visible.
  */
  @property string view() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("view");
  }

  /**
      Set `view` property.
      Params:
        propval = An optional view that the shortcuts in this group are relevant for.
          The group will be hidden if the #GtkShortcutsWindow:view-name property
          does not match the view of this group.
          
          Set this to null to make the group always visible.
  */
  @property void view(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("view", propval);
  }
}

/// Fluent builder implementation template for [gid.gtk3.shortcuts_group.ShortcutsGroup]
class ShortcutsGroupGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T
{


  /**
      Set `accelSizeGroup` property.
      Params:
        propval = The size group for the accelerator portion of shortcuts in this group.
          
          This is used internally by GTK+, and must not be modified by applications.
      Returns: Builder instance for fluent chaining
  */
  T accelSizeGroup(gid.gtk3.size_group.SizeGroup propval) nothrow
  {
    return setProperty("accel-size-group", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this group of shortcuts.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `titleSizeGroup` property.
      Params:
        propval = The size group for the textual portion of shortcuts in this group.
          
          This is used internally by GTK+, and must not be modified by applications.
      Returns: Builder instance for fluent chaining
  */
  T titleSizeGroup(gid.gtk3.size_group.SizeGroup propval) nothrow
  {
    return setProperty("title-size-group", propval);
  }

  /**
      Set `view` property.
      Params:
        propval = An optional view that the shortcuts in this group are relevant for.
          The group will be hidden if the #GtkShortcutsWindow:view-name property
          does not match the view of this group.
          
          Set this to null to make the group always visible.
      Returns: Builder instance for fluent chaining
  */
  T view(string propval) nothrow
  {
    return setProperty("view", propval);
  }
}

/// Fluent builder for [gid.gtk3.shortcuts_group.ShortcutsGroup]
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
