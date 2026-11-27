/// Module for [ShortcutsShortcut] class
module gid.gtk4.shortcuts_shortcut;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.icon;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.size_group;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    A [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut] represents a single keyboard shortcut or gesture
    with a short text.
    
    This widget is only meant to be used with [gid.gtk4.shortcuts_window.ShortcutsWindow].

    Deprecated: This widget will be removed in GTK 5
*/
@gidGir("ShortcutsShortcut", "ShortcutsShortcutClass")
class ShortcutsShortcut : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_shortcuts_shortcut_get_type != &gidSymbolNotFound ? gtk_shortcuts_shortcut_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkShortcutsShortcut";
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsShortcut self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut]
      Returns: New builder object
  */
  static ShortcutsShortcutGidBuilder builder() nothrow
  {
    return new ShortcutsShortcutGidBuilder;
  }

  /**
      Set `accelSizeGroup` property.
      Params:
        propval = The size group for the accelerator portion of this shortcut.
          
          This is used internally by GTK, and must not be modified by applications.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void accelSizeGroup(gid.gtk4.size_group.SizeGroup propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.size_group.SizeGroup)("accel-size-group", propval);
  }

  /**
      Get `accelerator` property.
      Returns: The accelerator(s) represented by this object.
        
        This property is used if [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.shortcutType]
        is set to [gid.gtk4.types.ShortcutType.Accelerator].
        
        The syntax of this property is (an extension of) the syntax understood
        by `func@Gtk.accelerator_parse`. Multiple accelerators can be specified
        by separating them with a space, but keep in mind that the available width
        is limited.
        
        It is also possible to specify ranges of shortcuts, using `...` between
        the keys. Sequences of keys can be specified using a `+` or `&` between
        the keys.
        
        Examples:
        
        - A single shortcut: `<ctl><alt>delete`
        - Two alternative shortcuts: `<shift>a Home`
        - A range of shortcuts: `<alt>1...<alt>9`
        - Several keys pressed together: `Control_L&Control_R`
        - A sequence of shortcuts or keys: `<ctl>c+<ctl>x`
        
        Use "+" instead of "&" when the keys may (or have to be) pressed
        sequentially (e.g use "t+t" for 'press the t key twice').
        
        Note that `<`, `>` and `&` need to be escaped as `&lt;`, `&gt`; and `&amp`; when used
        in .ui files.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string accelerator() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("accelerator");
  }

  /**
      Set `accelerator` property.
      Params:
        propval = The accelerator(s) represented by this object.
          
          This property is used if [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.shortcutType]
          is set to [gid.gtk4.types.ShortcutType.Accelerator].
          
          The syntax of this property is (an extension of) the syntax understood
          by `func@Gtk.accelerator_parse`. Multiple accelerators can be specified
          by separating them with a space, but keep in mind that the available width
          is limited.
          
          It is also possible to specify ranges of shortcuts, using `...` between
          the keys. Sequences of keys can be specified using a `+` or `&` between
          the keys.
          
          Examples:
          
          - A single shortcut: `<ctl><alt>delete`
          - Two alternative shortcuts: `<shift>a Home`
          - A range of shortcuts: `<alt>1...<alt>9`
          - Several keys pressed together: `Control_L&Control_R`
          - A sequence of shortcuts or keys: `<ctl>c+<ctl>x`
          
          Use "+" instead of "&" when the keys may (or have to be) pressed
          sequentially (e.g use "t+t" for 'press the t key twice').
          
          Note that `<`, `>` and `&` need to be escaped as `&lt;`, `&gt`; and `&amp`; when used
          in .ui files.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void accelerator(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("accelerator", propval);
  }

  /**
      Get `actionName` property.
      Returns: A detailed action name.
        
        If this is set for a shortcut of type [gid.gtk4.types.ShortcutType.Accelerator],
        then GTK will use the accelerators that are associated with the
        action via [gid.gtk4.application.Application.setAccelsForAction], and
        setting [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.accelerator] is not necessary.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string actionName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("action-name");
  }

  /**
      Set `actionName` property.
      Params:
        propval = A detailed action name.
          
          If this is set for a shortcut of type [gid.gtk4.types.ShortcutType.Accelerator],
          then GTK will use the accelerators that are associated with the
          action via [gid.gtk4.application.Application.setAccelsForAction], and
          setting [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.accelerator] is not necessary.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void actionName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("action-name", propval);
  }

  /**
      Get `direction` property.
      Returns: The text direction for which this shortcut is active.
        
        If the shortcut is used regardless of the text direction,
        set this property to [gid.gtk4.types.TextDirection.None].
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property gid.gtk4.types.TextDirection direction() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.types.TextDirection)("direction");
  }

  /**
      Set `direction` property.
      Params:
        propval = The text direction for which this shortcut is active.
          
          If the shortcut is used regardless of the text direction,
          set this property to [gid.gtk4.types.TextDirection.None].
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void direction(gid.gtk4.types.TextDirection propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.types.TextDirection)("direction", propval);
  }

  /**
      Get `icon` property.
      Returns: An icon to represent the shortcut or gesture.
        
        This property is used if [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.shortcutType]
        is set to [gid.gtk4.types.ShortcutType.Gesture].
        
        For the other predefined gesture types, GTK provides an icon on its own.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property gid.gio2.icon.Icon icon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.icon.Icon)("icon");
  }

  /**
      Set `icon` property.
      Params:
        propval = An icon to represent the shortcut or gesture.
          
          This property is used if [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.shortcutType]
          is set to [gid.gtk4.types.ShortcutType.Gesture].
          
          For the other predefined gesture types, GTK provides an icon on its own.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void icon(gid.gio2.icon.Icon propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.icon.Icon)("icon", propval);
  }

  /**
      Get `iconSet` property.
      Returns: true if an icon has been set.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property bool iconSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("icon-set");
  }

  /**
      Set `iconSet` property.
      Params:
        propval = true if an icon has been set.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void iconSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("icon-set", propval);
  }

  /**
      Get `shortcutType` property.
      Returns: The type of shortcut that is represented.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property gid.gtk4.types.ShortcutType shortcutType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.types.ShortcutType)("shortcut-type");
  }

  /**
      Set `shortcutType` property.
      Params:
        propval = The type of shortcut that is represented.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void shortcutType(gid.gtk4.types.ShortcutType propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.types.ShortcutType)("shortcut-type", propval);
  }

  /**
      Get `subtitle` property.
      Returns: The subtitle for the shortcut or gesture.
        
        This is typically used for gestures and should be a short, one-line
        text that describes the gesture itself. For the predefined gesture
        types, GTK provides a subtitle on its own.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string subtitle() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("subtitle");
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The subtitle for the shortcut or gesture.
          
          This is typically used for gestures and should be a short, one-line
          text that describes the gesture itself. For the predefined gesture
          types, GTK provides a subtitle on its own.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void subtitle(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("subtitle", propval);
  }

  /**
      Get `subtitleSet` property.
      Returns: true if a subtitle has been set.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property bool subtitleSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("subtitle-set");
  }

  /**
      Set `subtitleSet` property.
      Params:
        propval = true if a subtitle has been set.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void subtitleSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("subtitle-set", propval);
  }

  /**
      Get `title` property.
      Returns: The textual description for the shortcut or gesture represented by
        this object.
        
        This should be a short string that can fit in a single line.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string title() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The textual description for the shortcut or gesture represented by
          this object.
          
          This should be a short string that can fit in a single line.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void title(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  /**
      Set `titleSizeGroup` property.
      Params:
        propval = The size group for the textual portion of this shortcut.
          
          This is used internally by GTK, and must not be modified by applications.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void titleSizeGroup(gid.gtk4.size_group.SizeGroup propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.size_group.SizeGroup)("title-size-group", propval);
  }
}

/// Fluent builder implementation template for [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut]
class ShortcutsShortcutGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `accelSizeGroup` property.
      Params:
        propval = The size group for the accelerator portion of this shortcut.
          
          This is used internally by GTK, and must not be modified by applications.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T accelSizeGroup(gid.gtk4.size_group.SizeGroup propval) nothrow
  {
    return setProperty("accel-size-group", propval);
  }

  /**
      Set `accelerator` property.
      Params:
        propval = The accelerator(s) represented by this object.
          
          This property is used if [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.shortcutType]
          is set to [gid.gtk4.types.ShortcutType.Accelerator].
          
          The syntax of this property is (an extension of) the syntax understood
          by `func@Gtk.accelerator_parse`. Multiple accelerators can be specified
          by separating them with a space, but keep in mind that the available width
          is limited.
          
          It is also possible to specify ranges of shortcuts, using `...` between
          the keys. Sequences of keys can be specified using a `+` or `&` between
          the keys.
          
          Examples:
          
          - A single shortcut: `<ctl><alt>delete`
          - Two alternative shortcuts: `<shift>a Home`
          - A range of shortcuts: `<alt>1...<alt>9`
          - Several keys pressed together: `Control_L&Control_R`
          - A sequence of shortcuts or keys: `<ctl>c+<ctl>x`
          
          Use "+" instead of "&" when the keys may (or have to be) pressed
          sequentially (e.g use "t+t" for 'press the t key twice').
          
          Note that `<`, `>` and `&` need to be escaped as `&lt;`, `&gt`; and `&amp`; when used
          in .ui files.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T accelerator(string propval) nothrow
  {
    return setProperty("accelerator", propval);
  }

  /**
      Set `actionName` property.
      Params:
        propval = A detailed action name.
          
          If this is set for a shortcut of type [gid.gtk4.types.ShortcutType.Accelerator],
          then GTK will use the accelerators that are associated with the
          action via [gid.gtk4.application.Application.setAccelsForAction], and
          setting [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.accelerator] is not necessary.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T actionName(string propval) nothrow
  {
    return setProperty("action-name", propval);
  }

  /**
      Set `direction` property.
      Params:
        propval = The text direction for which this shortcut is active.
          
          If the shortcut is used regardless of the text direction,
          set this property to [gid.gtk4.types.TextDirection.None].
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T direction(gid.gtk4.types.TextDirection propval) nothrow
  {
    return setProperty("direction", propval);
  }

  /**
      Set `icon` property.
      Params:
        propval = An icon to represent the shortcut or gesture.
          
          This property is used if [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.shortcutType]
          is set to [gid.gtk4.types.ShortcutType.Gesture].
          
          For the other predefined gesture types, GTK provides an icon on its own.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T icon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("icon", propval);
  }

  /**
      Set `iconSet` property.
      Params:
        propval = true if an icon has been set.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T iconSet(bool propval) nothrow
  {
    return setProperty("icon-set", propval);
  }

  /**
      Set `shortcutType` property.
      Params:
        propval = The type of shortcut that is represented.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T shortcutType(gid.gtk4.types.ShortcutType propval) nothrow
  {
    return setProperty("shortcut-type", propval);
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The subtitle for the shortcut or gesture.
          
          This is typically used for gestures and should be a short, one-line
          text that describes the gesture itself. For the predefined gesture
          types, GTK provides a subtitle on its own.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T subtitle(string propval) nothrow
  {
    return setProperty("subtitle", propval);
  }

  /**
      Set `subtitleSet` property.
      Params:
        propval = true if a subtitle has been set.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T subtitleSet(bool propval) nothrow
  {
    return setProperty("subtitle-set", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The textual description for the shortcut or gesture represented by
          this object.
          
          This should be a short string that can fit in a single line.
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
        propval = The size group for the textual portion of this shortcut.
          
          This is used internally by GTK, and must not be modified by applications.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T titleSizeGroup(gid.gtk4.size_group.SizeGroup propval) nothrow
  {
    return setProperty("title-size-group", propval);
  }
}

/// Fluent builder for [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut]
final class ShortcutsShortcutGidBuilder : ShortcutsShortcutGidBuilderImpl!ShortcutsShortcutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShortcutsShortcut build() nothrow
  {
    return new ShortcutsShortcut(cast(void*)createGObject(ShortcutsShortcut._getGType), Yes.Take);
  }
}
