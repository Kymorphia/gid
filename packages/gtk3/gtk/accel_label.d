/// Module for [AccelLabel] class
module gtk.accel_label;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.types;
import gid.gid;
import gobject.closure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.label;
import gtk.types;
import gtk.widget;

/**
    The #GtkAccelLabel widget is a subclass of #GtkLabel that also displays an
    accelerator key on the right of the label text, e.g. “Ctrl+S”.
    It is commonly used in menus to show the keyboard short-cuts for commands.
    
    The accelerator key to display is typically not set explicitly (although it
    can be, with [gtk.accel_label.AccelLabel.setAccel]). Instead, the #GtkAccelLabel displays
    the accelerators which have been added to a particular widget. This widget is
    set by calling [gtk.accel_label.AccelLabel.setAccelWidget].
    
    For example, a #GtkMenuItem widget may have an accelerator added to emit
    the “activate” signal when the “Ctrl+S” key combination is pressed.
    A #GtkAccelLabel is created and added to the #GtkMenuItem, and
    [gtk.accel_label.AccelLabel.setAccelWidget] is called with the #GtkMenuItem as the
    second argument. The #GtkAccelLabel will now display “Ctrl+S” after its label.
    
    Note that creating a #GtkMenuItem with [gtk.menu_item.MenuItem.newWithLabel] (or
    one of the similar functions for #GtkCheckMenuItem and #GtkRadioMenuItem)
    automatically adds a #GtkAccelLabel to the #GtkMenuItem and calls
    [gtk.accel_label.AccelLabel.setAccelWidget] to set it up for you.
    
    A #GtkAccelLabel will only display accelerators which have [gtk.types.AccelFlags.Visible]
    set (see #GtkAccelFlags).
    A #GtkAccelLabel can display multiple accelerators and even signal names,
    though it is almost always used to display just one accelerator key.
    
    ## Creating a simple menu item with an accelerator key.
    
    ```c
      GtkWidget *window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      GtkWidget *menu = gtk_menu_new ();
      GtkWidget *save_item;
      GtkAccelGroup *accel_group;
    
      // Create a GtkAccelGroup and add it to the window.
      accel_group = gtk_accel_group_new ();
      gtk_window_add_accel_group (GTK_WINDOW (window), accel_group);
    
      // Create the menu item using the convenience function.
      save_item = gtk_menu_item_new_with_label ("Save");
      gtk_widget_show (save_item);
      gtk_container_add (GTK_CONTAINER (menu), save_item);
    
      // Now add the accelerator to the GtkMenuItem. Note that since we
      // called gtk_menu_item_new_with_label() to create the GtkMenuItem
      // the GtkAccelLabel is automatically set up to display the
      // GtkMenuItem accelerators. We just need to make sure we use
      // GTK_ACCEL_VISIBLE here.
      gtk_widget_add_accelerator (save_item, "activate", accel_group,
                                  GDK_KEY_s, GDK_CONTROL_MASK, GTK_ACCEL_VISIBLE);
    ```
    
    # CSS nodes
    
    ```plain
    label
    ╰── accelerator
    ```
    
    Like #GtkLabel, GtkAccelLabel has a main CSS node with the name label.
    It adds a subnode with name accelerator.
*/
class AccelLabel : gtk.label.Label
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
    return cast(void function())gtk_accel_label_get_type != &gidSymbolNotFound ? gtk_accel_label_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AccelLabel self()
  {
    return this;
  }

  /** */
  @property gobject.closure.Closure accelClosure()
  {
    return gobject.object.ObjectWrap.getProperty!(gobject.closure.Closure)("accel-closure");
  }

  /** */
  @property void accelClosure(gobject.closure.Closure propval)
  {
    return setAccelClosure(propval);
  }

  /** */
  @property gtk.widget.Widget accelWidget()
  {
    return getAccelWidget();
  }

  /** */
  @property void accelWidget(gtk.widget.Widget propval)
  {
    return setAccelWidget(propval);
  }

  /**
      Creates a new #GtkAccelLabel.
  
      Params:
        string_ = the label string. Must be non-null.
      Returns: a new #GtkAccelLabel.
  */
  this(string string_)
  {
    GtkWidget* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gtk_accel_label_new(_string_);
    this(_cretval, No.Take);
  }

  /**
      Gets the keyval and modifier mask set with
      [gtk.accel_label.AccelLabel.setAccel].
  
      Params:
        acceleratorKey = return location for the keyval
        acceleratorMods = return location for the modifier mask
  */
  void getAccel(out uint acceleratorKey, out gdk.types.ModifierType acceleratorMods)
  {
    gtk_accel_label_get_accel(cast(GtkAccelLabel*)this._cPtr, cast(uint*)&acceleratorKey, &acceleratorMods);
  }

  /**
      Fetches the widget monitored by this accelerator label. See
      [gtk.accel_label.AccelLabel.setAccelWidget].
      Returns: the object monitored by the accelerator label, or null.
  */
  gtk.widget.Widget getAccelWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_accel_label_get_accel_widget(cast(GtkAccelLabel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the width needed to display the accelerator key(s).
      This is used by menus to align all of the #GtkMenuItem widgets, and shouldn't
      be needed by applications.
      Returns: the width needed to display the accelerator key(s).
  */
  uint getAccelWidth()
  {
    uint _retval;
    _retval = gtk_accel_label_get_accel_width(cast(GtkAccelLabel*)this._cPtr);
    return _retval;
  }

  /**
      Recreates the string representing the accelerator keys.
      This should not be needed since the string is automatically updated whenever
      accelerators are added or removed from the associated widget.
      Returns: always returns false.
  */
  bool refetch()
  {
    bool _retval;
    _retval = cast(bool)gtk_accel_label_refetch(cast(GtkAccelLabel*)this._cPtr);
    return _retval;
  }

  /**
      Manually sets a keyval and modifier mask as the accelerator rendered
      by accel_label.
      
      If a keyval and modifier are explicitly set then these values are
      used regardless of any associated accel closure or widget.
      
      Providing an accelerator_key of 0 removes the manual setting.
  
      Params:
        acceleratorKey = a keyval, or 0
        acceleratorMods = the modifier mask for the accel
  */
  void setAccel(uint acceleratorKey, gdk.types.ModifierType acceleratorMods)
  {
    gtk_accel_label_set_accel(cast(GtkAccelLabel*)this._cPtr, acceleratorKey, acceleratorMods);
  }

  /**
      Sets the closure to be monitored by this accelerator label. The closure
      must be connected to an accelerator group; see [gtk.accel_group.AccelGroup.connect].
      Passing null for accel_closure will dissociate accel_label from its
      current closure, if any.
  
      Params:
        accelClosure = the closure to monitor for accelerator changes,
          or null
  */
  void setAccelClosure(gobject.closure.Closure accelClosure = null)
  {
    gtk_accel_label_set_accel_closure(cast(GtkAccelLabel*)this._cPtr, accelClosure ? cast(GClosure*)accelClosure._cPtr(No.Dup) : null);
  }

  /**
      Sets the widget to be monitored by this accelerator label. Passing null for
      accel_widget will dissociate accel_label from its current widget, if any.
  
      Params:
        accelWidget = the widget to be monitored, or null
  */
  void setAccelWidget(gtk.widget.Widget accelWidget = null)
  {
    gtk_accel_label_set_accel_widget(cast(GtkAccelLabel*)this._cPtr, accelWidget ? cast(GtkWidget*)accelWidget._cPtr(No.Dup) : null);
  }
}
