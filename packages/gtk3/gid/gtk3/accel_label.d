/// Module for [AccelLabel] class
module gid.gtk3.accel_label;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.gid;
import gid.gdk3.types;
import gid.gobject2.closure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.label;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    The #GtkAccelLabel widget is a subclass of #GtkLabel that also displays an
    accelerator key on the right of the label text, e.g. “Ctrl+S”.
    It is commonly used in menus to show the keyboard short-cuts for commands.
    
    The accelerator key to display is typically not set explicitly (although it
    can be, with [gid.gtk3.accel_label.AccelLabel.setAccel]). Instead, the #GtkAccelLabel displays
    the accelerators which have been added to a particular widget. This widget is
    set by calling [gid.gtk3.accel_label.AccelLabel.setAccelWidget].
    
    For example, a #GtkMenuItem widget may have an accelerator added to emit
    the “activate” signal when the “Ctrl+S” key combination is pressed.
    A #GtkAccelLabel is created and added to the #GtkMenuItem, and
    [gid.gtk3.accel_label.AccelLabel.setAccelWidget] is called with the #GtkMenuItem as the
    second argument. The #GtkAccelLabel will now display “Ctrl+S” after its label.
    
    Note that creating a #GtkMenuItem with [gid.gtk3.menu_item.MenuItem.newWithLabel] (or
    one of the similar functions for #GtkCheckMenuItem and #GtkRadioMenuItem)
    automatically adds a #GtkAccelLabel to the #GtkMenuItem and calls
    [gid.gtk3.accel_label.AccelLabel.setAccelWidget] to set it up for you.
    
    A #GtkAccelLabel will only display accelerators which have [gid.gtk3.types.AccelFlags.Visible]
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
class AccelLabel : gid.gtk3.label.Label
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
    return cast(void function())gtk_accel_label_get_type != &gidSymbolNotFound ? gtk_accel_label_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkAccelLabel";
  }

  /** Returns `this`, for use in `with` statements. */
  override AccelLabel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.accel_label.AccelLabel]
      Returns: New builder object
  */
  static AccelLabelGidBuilder builder() nothrow
  {
    return new AccelLabelGidBuilder;
  }

  /** */
  @property gid.gobject2.closure.Closure accelClosure() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gobject2.closure.Closure)("accel-closure");
  }

  /** */
  @property void accelClosure(gid.gobject2.closure.Closure propval) nothrow
  {
    setAccelClosure(propval);
  }

  /** */
  @property gid.gtk3.widget.Widget accelWidget() nothrow
  {
    return getAccelWidget();
  }

  /** */
  @property void accelWidget(gid.gtk3.widget.Widget propval) nothrow
  {
    setAccelWidget(propval);
  }

  /**
      Creates a new #GtkAccelLabel.
  
      Params:
        string_ = the label string. Must be non-null.
      Returns: a new #GtkAccelLabel.
  */
  this(string string_) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_accel_label_new(_string_);
    this(_cretval, No.Take);
  }

  /**
      Gets the keyval and modifier mask set with
      [gid.gtk3.accel_label.AccelLabel.setAccel].
  
      Params:
        acceleratorKey = return location for the keyval
        acceleratorMods = return location for the modifier mask
  */
  void getAccel(out uint acceleratorKey, out gid.gdk3.types.ModifierType acceleratorMods) nothrow
  {
    gtk_accel_label_get_accel(cast(GtkAccelLabel*)this._cPtr, cast(uint*)&acceleratorKey, &acceleratorMods);
  }

  /**
      Fetches the widget monitored by this accelerator label. See
      [gid.gtk3.accel_label.AccelLabel.setAccelWidget].
      Returns: the object monitored by the accelerator label, or null.
  */
  gid.gtk3.widget.Widget getAccelWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_accel_label_get_accel_widget(cast(GtkAccelLabel*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the width needed to display the accelerator key(s).
      This is used by menus to align all of the #GtkMenuItem widgets, and shouldn't
      be needed by applications.
      Returns: the width needed to display the accelerator key(s).
  */
  uint getAccelWidth() nothrow
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
  bool refetch() nothrow
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
  void setAccel(uint acceleratorKey, gid.gdk3.types.ModifierType acceleratorMods) nothrow
  {
    gtk_accel_label_set_accel(cast(GtkAccelLabel*)this._cPtr, acceleratorKey, acceleratorMods);
  }

  /**
      Sets the closure to be monitored by this accelerator label. The closure
      must be connected to an accelerator group; see [gid.gtk3.accel_group.AccelGroup.connect].
      Passing null for accel_closure will dissociate accel_label from its
      current closure, if any.
  
      Params:
        accelClosure = the closure to monitor for accelerator changes,
          or null
  */
  void setAccelClosure(gid.gobject2.closure.Closure accelClosure = null) nothrow
  {
    gtk_accel_label_set_accel_closure(cast(GtkAccelLabel*)this._cPtr, accelClosure ? cast(GClosure*)accelClosure._cPtr(No.Dup) : null);
  }

  /**
      Sets the widget to be monitored by this accelerator label. Passing null for
      accel_widget will dissociate accel_label from its current widget, if any.
  
      Params:
        accelWidget = the widget to be monitored, or null
  */
  void setAccelWidget(gid.gtk3.widget.Widget accelWidget = null) nothrow
  {
    gtk_accel_label_set_accel_widget(cast(GtkAccelLabel*)this._cPtr, accelWidget ? cast(GtkWidget*)accelWidget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.accel_label.AccelLabel]
class AccelLabelGidBuilderImpl(T) : gid.gtk3.label.LabelGidBuilderImpl!T
{


  /** */
  T accelClosure(gid.gobject2.closure.Closure propval) nothrow
  {
    return setProperty("accel-closure", propval);
  }

  /** */
  T accelWidget(gid.gtk3.widget.Widget propval) nothrow
  {
    return setProperty("accel-widget", propval);
  }
}

/// Fluent builder for [gid.gtk3.accel_label.AccelLabel]
final class AccelLabelGidBuilder : AccelLabelGidBuilderImpl!AccelLabelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AccelLabel build() nothrow
  {
    return new AccelLabel(cast(void*)createGObject(AccelLabel._getGType), Yes.Take);
  }
}
