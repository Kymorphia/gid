/// Module for [ShortcutsShortcut] class
module gtk.shortcuts_shortcut;

import gid.gid;
import gio.icon;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.size_group;
import gtk.types;
import gtk.widget;

/**
    A [gtk.shortcuts_shortcut.ShortcutsShortcut] represents a single keyboard shortcut or gesture
    with a short text.
    
    This widget is only meant to be used with [gtk.shortcuts_window.ShortcutsWindow].
*/
class ShortcutsShortcut : gtk.widget.Widget
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
    return cast(void function())gtk_shortcuts_shortcut_get_type != &gidSymbolNotFound ? gtk_shortcuts_shortcut_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutsShortcut self()
  {
    return this;
  }

  /**
      Set `accelSizeGroup` property.
      Params:
        propval = The size group for the accelerator portion of this shortcut.
          
          This is used internally by GTK, and must not be modified by applications.
  */
  @property void accelSizeGroup(gtk.size_group.SizeGroup propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.size_group.SizeGroup)("accel-size-group", propval);
  }

  /**
      Get `accelerator` property.
      Returns: The accelerator(s) represented by this object.
        
        This property is used if `property@Gtk.ShortcutsShortcut:shortcut-type`
        is set to [gtk.types.ShortcutType.Accelerator].
        
        The syntax of this property is (an extension of) the syntax understood
        by `func@Gtk.accelerator_parse`. Multiple accelerators can be specified
        by separating them with a space, but keep in mind that the available width
        is limited.
        
        It is also possible to specify ranges of shortcuts, using `...` between
        the keys. Sequences of keys can be specified using a `+` or `&` between
        the keys.
        
        Examples:
        
        $(LIST
          * A single shortcut: `<ctl><alt>delete`
          * Two alternative shortcuts: `<shift>a Home`
          * A range of shortcuts: `<alt>1...<alt>9`
          * Several keys pressed together: `Control_L&Control_R`
          * A sequence of shortcuts or keys: `<ctl>c+<ctl>x`
        )
          
        Use "+" instead of "&" when the keys may (or have to be) pressed
        sequentially (e.g use "t+t" for 'press the t key twice').
        
        Note that `<`, `>` and `&` need to be escaped as `&lt;`, `&gt`; and `&amp`; when used
        in .ui files.
  */
  @property string accelerator()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("accelerator");
  }

  /**
      Set `accelerator` property.
      Params:
        propval = The accelerator(s) represented by this object.
          
          This property is used if `property@Gtk.ShortcutsShortcut:shortcut-type`
          is set to [gtk.types.ShortcutType.Accelerator].
          
          The syntax of this property is (an extension of) the syntax understood
          by `func@Gtk.accelerator_parse`. Multiple accelerators can be specified
          by separating them with a space, but keep in mind that the available width
          is limited.
          
          It is also possible to specify ranges of shortcuts, using `...` between
          the keys. Sequences of keys can be specified using a `+` or `&` between
          the keys.
          
          Examples:
          
          $(LIST
            * A single shortcut: `<ctl><alt>delete`
            * Two alternative shortcuts: `<shift>a Home`
            * A range of shortcuts: `<alt>1...<alt>9`
            * Several keys pressed together: `Control_L&Control_R`
            * A sequence of shortcuts or keys: `<ctl>c+<ctl>x`
          )
            
          Use "+" instead of "&" when the keys may (or have to be) pressed
          sequentially (e.g use "t+t" for 'press the t key twice').
          
          Note that `<`, `>` and `&` need to be escaped as `&lt;`, `&gt`; and `&amp`; when used
          in .ui files.
  */
  @property void accelerator(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("accelerator", propval);
  }

  /**
      Get `actionName` property.
      Returns: A detailed action name.
        
        If this is set for a shortcut of type [gtk.types.ShortcutType.Accelerator],
        then GTK will use the accelerators that are associated with the
        action via [gtk.application.Application.setAccelsForAction], and
        setting [gtk.shortcuts_shortcut.ShortcutsShortcut.accelerator] is not necessary.
  */
  @property string actionName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("action-name");
  }

  /**
      Set `actionName` property.
      Params:
        propval = A detailed action name.
          
          If this is set for a shortcut of type [gtk.types.ShortcutType.Accelerator],
          then GTK will use the accelerators that are associated with the
          action via [gtk.application.Application.setAccelsForAction], and
          setting [gtk.shortcuts_shortcut.ShortcutsShortcut.accelerator] is not necessary.
  */
  @property void actionName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("action-name", propval);
  }

  /**
      Get `direction` property.
      Returns: The text direction for which this shortcut is active.
        
        If the shortcut is used regardless of the text direction,
        set this property to [gtk.types.TextDirection.None].
  */
  @property gtk.types.TextDirection direction()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.TextDirection)("direction");
  }

  /**
      Set `direction` property.
      Params:
        propval = The text direction for which this shortcut is active.
          
          If the shortcut is used regardless of the text direction,
          set this property to [gtk.types.TextDirection.None].
  */
  @property void direction(gtk.types.TextDirection propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.TextDirection)("direction", propval);
  }

  /**
      Get `icon` property.
      Returns: An icon to represent the shortcut or gesture.
        
        This property is used if `property@Gtk.ShortcutsShortcut:shortcut-type`
        is set to [gtk.types.ShortcutType.Gesture].
        
        For the other predefined gesture types, GTK provides an icon on its own.
  */
  @property gio.icon.Icon icon()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.icon.Icon)("icon");
  }

  /**
      Set `icon` property.
      Params:
        propval = An icon to represent the shortcut or gesture.
          
          This property is used if `property@Gtk.ShortcutsShortcut:shortcut-type`
          is set to [gtk.types.ShortcutType.Gesture].
          
          For the other predefined gesture types, GTK provides an icon on its own.
  */
  @property void icon(gio.icon.Icon propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.icon.Icon)("icon", propval);
  }

  /**
      Get `iconSet` property.
      Returns: true if an icon has been set.
  */
  @property bool iconSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("icon-set");
  }

  /**
      Set `iconSet` property.
      Params:
        propval = true if an icon has been set.
  */
  @property void iconSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("icon-set", propval);
  }

  /**
      Get `shortcutType` property.
      Returns: The type of shortcut that is represented.
  */
  @property gtk.types.ShortcutType shortcutType()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.ShortcutType)("shortcut-type");
  }

  /**
      Set `shortcutType` property.
      Params:
        propval = The type of shortcut that is represented.
  */
  @property void shortcutType(gtk.types.ShortcutType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.ShortcutType)("shortcut-type", propval);
  }

  /**
      Get `subtitle` property.
      Returns: The subtitle for the shortcut or gesture.
        
        This is typically used for gestures and should be a short, one-line
        text that describes the gesture itself. For the predefined gesture
        types, GTK provides a subtitle on its own.
  */
  @property string subtitle()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("subtitle");
  }

  /**
      Set `subtitle` property.
      Params:
        propval = The subtitle for the shortcut or gesture.
          
          This is typically used for gestures and should be a short, one-line
          text that describes the gesture itself. For the predefined gesture
          types, GTK provides a subtitle on its own.
  */
  @property void subtitle(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("subtitle", propval);
  }

  /**
      Get `subtitleSet` property.
      Returns: true if a subtitle has been set.
  */
  @property bool subtitleSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("subtitle-set");
  }

  /**
      Set `subtitleSet` property.
      Params:
        propval = true if a subtitle has been set.
  */
  @property void subtitleSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("subtitle-set", propval);
  }

  /**
      Get `title` property.
      Returns: The textual description for the shortcut or gesture represented by
        this object.
        
        This should be a short string that can fit in a single line.
  */
  @property string title()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("title");
  }

  /**
      Set `title` property.
      Params:
        propval = The textual description for the shortcut or gesture represented by
          this object.
          
          This should be a short string that can fit in a single line.
  */
  @property void title(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  /**
      Set `titleSizeGroup` property.
      Params:
        propval = The size group for the textual portion of this shortcut.
          
          This is used internally by GTK, and must not be modified by applications.
  */
  @property void titleSizeGroup(gtk.size_group.SizeGroup propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.size_group.SizeGroup)("title-size-group", propval);
  }
}
