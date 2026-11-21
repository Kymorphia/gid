/// Module for [ShortcutsShortcut] class
module gid.gtk3.shortcuts_shortcut;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.gid;
import gid.gio2.icon;
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
    A GtkShortcutsShortcut represents a single keyboard shortcut or gesture
    with a short text. This widget is only meant to be used with #GtkShortcutsWindow.
*/
class ShortcutsShortcut : gid.gtk3.box.Box
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
      Get builder for [gid.gtk3.shortcuts_shortcut.ShortcutsShortcut]
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
          
          This is used internally by GTK+, and must not be modified by applications.
  */
  @property void accelSizeGroup(gid.gtk3.size_group.SizeGroup propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.size_group.SizeGroup)("accel-size-group", propval);
  }

  /**
      Get `accelerator` property.
      Returns: The accelerator(s) represented by this object. This property is used
        if #GtkShortcutsShortcut:shortcut-type is set to #GTK_SHORTCUT_ACCELERATOR.
        
        The syntax of this property is (an extension of) the syntax understood by
        [gid.gtk4.global.acceleratorParse]. Multiple accelerators can be specified by separating
        them with a space, but keep in mind that the available width is limited.
        It is also possible to specify ranges of shortcuts, using `...` between the keys.
        Sequences of keys can be specified using a `+` or `&` between the keys.
        
        Examples:
        
        - A single shortcut: `<ctl><alt>delete`
        - Two alternative shortcuts: `<shift>a Home`
        - A range of shortcuts: `<alt>1...<alt>9`
        - Several keys pressed together: `Control_L&Control_R`
        - A sequence of shortcuts or keys: `<ctl>c+<ctl>x`
        
        Use + instead of & when the keys may (or have to be) pressed sequentially (e.g
        use t+t for 'press the t key twice').
        
        Note that `<`, `>` and `&` need to be escaped as &lt;, &gt; and &amp; when used
        in .ui files.
  */
  @property string accelerator() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("accelerator");
  }

  /**
      Set `accelerator` property.
      Params:
        propval = The accelerator(s) represented by this object. This property is used
          if #GtkShortcutsShortcut:shortcut-type is set to #GTK_SHORTCUT_ACCELERATOR.
          
          The syntax of this property is (an extension of) the syntax understood by
          [gid.gtk4.global.acceleratorParse]. Multiple accelerators can be specified by separating
          them with a space, but keep in mind that the available width is limited.
          It is also possible to specify ranges of shortcuts, using `...` between the keys.
          Sequences of keys can be specified using a `+` or `&` between the keys.
          
          Examples:
          
          - A single shortcut: `<ctl><alt>delete`
          - Two alternative shortcuts: `<shift>a Home`
          - A range of shortcuts: `<alt>1...<alt>9`
          - Several keys pressed together: `Control_L&Control_R`
          - A sequence of shortcuts or keys: `<ctl>c+<ctl>x`
          
          Use + instead of & when the keys may (or have to be) pressed sequentially (e.g
          use t+t for 'press the t key twice').
          
          Note that `<`, `>` and `&` need to be escaped as &lt;, &gt; and &amp; when used
          in .ui files.
  */
  @property void accelerator(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("accelerator", propval);
  }

  /**
      Get `actionName` property.
      Returns: A detailed action name. If this is set for a shortcut
        of type [gid.gtk4.types.ShortcutType.Accelerator], then GTK+ will use
        the accelerators that are associated with the action
        via [gid.gtk4.application.Application.setAccelsForAction], and setting
        #GtkShortcutsShortcut::accelerator is not necessary.
  */
  @property string actionName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("action-name");
  }

  /**
      Set `actionName` property.
      Params:
        propval = A detailed action name. If this is set for a shortcut
          of type [gid.gtk4.types.ShortcutType.Accelerator], then GTK+ will use
          the accelerators that are associated with the action
          via [gid.gtk4.application.Application.setAccelsForAction], and setting
          #GtkShortcutsShortcut::accelerator is not necessary.
  */
  @property void actionName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("action-name", propval);
  }

  /**
      Get `direction` property.
      Returns: The text direction for which this shortcut is active. If the shortcut
        is used regardless of the text direction, set this property to
        #GTK_TEXT_DIR_NONE.
  */
  @property gid.gtk3.types.TextDirection direction() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.TextDirection)("direction");
  }

  /**
      Set `direction` property.
      Params:
        propval = The text direction for which this shortcut is active. If the shortcut
          is used regardless of the text direction, set this property to
          #GTK_TEXT_DIR_NONE.
  */
  @property void direction(gid.gtk3.types.TextDirection propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.TextDirection)("direction", propval);
  }

  /**
      Get `icon` property.
      Returns: An icon to represent the shortcut or gesture. This property is used if
        #GtkShortcutsShortcut:shortcut-type is set to #GTK_SHORTCUT_GESTURE.
        For the other predefined gesture types, GTK+ provides an icon on its own.
  */
  @property gid.gio2.icon.Icon icon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.icon.Icon)("icon");
  }

  /**
      Set `icon` property.
      Params:
        propval = An icon to represent the shortcut or gesture. This property is used if
          #GtkShortcutsShortcut:shortcut-type is set to #GTK_SHORTCUT_GESTURE.
          For the other predefined gesture types, GTK+ provides an icon on its own.
  */
  @property void icon(gid.gio2.icon.Icon propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.icon.Icon)("icon", propval);
  }

  /**
      Get `iconSet` property.
      Returns: true if an icon has been set.
  */
  @property bool iconSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("icon-set");
  }

  /**
      Set `iconSet` property.
      Params:
        propval = true if an icon has been set.
  */
  @property void iconSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("icon-set", propval);
  }

  /**
      Get `shortcutType` property.
      Returns: The type of shortcut that is represented.
  */
  @property gid.gtk3.types.ShortcutType shortcutType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.ShortcutType)("shortcut-type");
  }

  /**
      Set `shortcutType` property.
      Params:
        propval = The type of shortcut that is represented.
  */
  @property void shortcutType(gid.gtk3.types.ShortcutType propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.ShortcutType)("shortcut-type", propval);
  }

  /**
      Get `subtitle` property.
      Returns: The subtitle for the shortcut or gesture.
        
        This is typically used for gestures and should be a short, one-line
        text that describes the gesture itself. For the predefined gesture
        types, GTK+ provides a subtitle on its own.
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
          types, GTK+ provides a subtitle on its own.
  */
  @property void subtitle(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("subtitle", propval);
  }

  /**
      Get `subtitleSet` property.
      Returns: true if a subtitle has been set.
  */
  @property bool subtitleSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("subtitle-set");
  }

  /**
      Set `subtitleSet` property.
      Params:
        propval = true if a subtitle has been set.
  */
  @property void subtitleSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("subtitle-set", propval);
  }

  /**
      Get `title` property.
      Returns: The textual description for the shortcut or gesture represented by
        this object. This should be a short string that can fit in a single line.
  */
  @property string title() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The textual description for the shortcut or gesture represented by
          this object. This should be a short string that can fit in a single line.
  */
  @property void title(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  /**
      Set `titleSizeGroup` property.
      Params:
        propval = The size group for the textual portion of this shortcut.
          
          This is used internally by GTK+, and must not be modified by applications.
  */
  @property void titleSizeGroup(gid.gtk3.size_group.SizeGroup propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.size_group.SizeGroup)("title-size-group", propval);
  }
}

/// Fluent builder implementation template for [gid.gtk3.shortcuts_shortcut.ShortcutsShortcut]
class ShortcutsShortcutGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T
{


  /**
      Set `accelSizeGroup` property.
      Params:
        propval = The size group for the accelerator portion of this shortcut.
          
          This is used internally by GTK+, and must not be modified by applications.
      Returns: Builder instance for fluent chaining
  */
  T accelSizeGroup(gid.gtk3.size_group.SizeGroup propval) nothrow
  {
    return setProperty("accel-size-group", propval);
  }

  /**
      Set `accelerator` property.
      Params:
        propval = The accelerator(s) represented by this object. This property is used
          if #GtkShortcutsShortcut:shortcut-type is set to #GTK_SHORTCUT_ACCELERATOR.
          
          The syntax of this property is (an extension of) the syntax understood by
          [gid.gtk4.global.acceleratorParse]. Multiple accelerators can be specified by separating
          them with a space, but keep in mind that the available width is limited.
          It is also possible to specify ranges of shortcuts, using `...` between the keys.
          Sequences of keys can be specified using a `+` or `&` between the keys.
          
          Examples:
          
          - A single shortcut: `<ctl><alt>delete`
          - Two alternative shortcuts: `<shift>a Home`
          - A range of shortcuts: `<alt>1...<alt>9`
          - Several keys pressed together: `Control_L&Control_R`
          - A sequence of shortcuts or keys: `<ctl>c+<ctl>x`
          
          Use + instead of & when the keys may (or have to be) pressed sequentially (e.g
          use t+t for 'press the t key twice').
          
          Note that `<`, `>` and `&` need to be escaped as &lt;, &gt; and &amp; when used
          in .ui files.
      Returns: Builder instance for fluent chaining
  */
  T accelerator(string propval) nothrow
  {
    return setProperty("accelerator", propval);
  }

  /**
      Set `actionName` property.
      Params:
        propval = A detailed action name. If this is set for a shortcut
          of type [gid.gtk4.types.ShortcutType.Accelerator], then GTK+ will use
          the accelerators that are associated with the action
          via [gid.gtk4.application.Application.setAccelsForAction], and setting
          #GtkShortcutsShortcut::accelerator is not necessary.
      Returns: Builder instance for fluent chaining
  */
  T actionName(string propval) nothrow
  {
    return setProperty("action-name", propval);
  }

  /**
      Set `direction` property.
      Params:
        propval = The text direction for which this shortcut is active. If the shortcut
          is used regardless of the text direction, set this property to
          #GTK_TEXT_DIR_NONE.
      Returns: Builder instance for fluent chaining
  */
  T direction(gid.gtk3.types.TextDirection propval) nothrow
  {
    return setProperty("direction", propval);
  }

  /**
      Set `icon` property.
      Params:
        propval = An icon to represent the shortcut or gesture. This property is used if
          #GtkShortcutsShortcut:shortcut-type is set to #GTK_SHORTCUT_GESTURE.
          For the other predefined gesture types, GTK+ provides an icon on its own.
      Returns: Builder instance for fluent chaining
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
  */
  T shortcutType(gid.gtk3.types.ShortcutType propval) nothrow
  {
    return setProperty("shortcut-type", propval);
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The subtitle for the shortcut or gesture.
          
          This is typically used for gestures and should be a short, one-line
          text that describes the gesture itself. For the predefined gesture
          types, GTK+ provides a subtitle on its own.
      Returns: Builder instance for fluent chaining
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
  */
  T subtitleSet(bool propval) nothrow
  {
    return setProperty("subtitle-set", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The textual description for the shortcut or gesture represented by
          this object. This should be a short string that can fit in a single line.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `titleSizeGroup` property.
      Params:
        propval = The size group for the textual portion of this shortcut.
          
          This is used internally by GTK+, and must not be modified by applications.
      Returns: Builder instance for fluent chaining
  */
  T titleSizeGroup(gid.gtk3.size_group.SizeGroup propval) nothrow
  {
    return setProperty("title-size-group", propval);
  }
}

/// Fluent builder for [gid.gtk3.shortcuts_shortcut.ShortcutsShortcut]
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
