/// Module for [ShortcutLabel] class
module gid.gtk4.shortcut_label;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    [gid.gtk4.shortcut_label.ShortcutLabel] displays a single keyboard shortcut or gesture.
    
    The main use case for [gid.gtk4.shortcut_label.ShortcutLabel] is inside a [gid.gtk4.shortcuts_window.ShortcutsWindow].

    Deprecated: This widget will be removed in GTK 5
*/
class ShortcutLabel : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_shortcut_label_get_type != &gidSymbolNotFound ? gtk_shortcut_label_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkShortcutLabel";
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutLabel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.shortcut_label.ShortcutLabel]
      Returns: New builder object
  */
  static ShortcutLabelGidBuilder builder() nothrow
  {
    return new ShortcutLabelGidBuilder;
  }

  /**
      Get `accelerator` property.
      Returns: The accelerator that @self displays.
        
        See [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.accelerator]
        for the accepted syntax.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string accelerator() nothrow
  {
    return getAccelerator();
  }

  /**
      Set `accelerator` property.
      Params:
        propval = The accelerator that @self displays.
          
          See [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.accelerator]
          for the accepted syntax.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void accelerator(string propval) nothrow
  {
    setAccelerator(propval);
  }

  /**
      Get `disabledText` property.
      Returns: The text that is displayed when no accelerator is set.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property string disabledText() nothrow
  {
    return getDisabledText();
  }

  /**
      Set `disabledText` property.
      Params:
        propval = The text that is displayed when no accelerator is set.
  
      Deprecated: This widget will be removed in GTK 5
  */
  @property void disabledText(string propval) nothrow
  {
    setDisabledText(propval);
  }

  /**
      Creates a new [gid.gtk4.shortcut_label.ShortcutLabel] with accelerator set.
  
      Params:
        accelerator = the initial accelerator
      Returns: a newly-allocated [gid.gtk4.shortcut_label.ShortcutLabel]
  
      Deprecated: This widget will be removed in GTK 5
  */
  this(string accelerator) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      const(char)* _accelerator = accelerator.toCString!(No.Malloc, No.Nullable);
      _cretval = gtk_shortcut_label_new(_accelerator);
      this(_cretval, No.Take);
    }
  }

  /**
      Retrieves the current accelerator of self.
      Returns: the current accelerator.
  
      Deprecated: This widget will be removed in GTK 5
  */
  string getAccelerator() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_shortcut_label_get_accelerator(cast(GtkShortcutLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the text that is displayed when no accelerator is set.
      Returns: the current text displayed when no
        accelerator is set.
  
      Deprecated: This widget will be removed in GTK 5
  */
  string getDisabledText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_shortcut_label_get_disabled_text(cast(GtkShortcutLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets the accelerator to be displayed by self.
  
      Params:
        accelerator = the new accelerator
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setAccelerator(string accelerator) nothrow
  {
    const(char)* _accelerator = accelerator.toCString!(No.Malloc, No.Nullable);
    gtk_shortcut_label_set_accelerator(cast(GtkShortcutLabel*)this._cPtr, _accelerator);
  }

  /**
      Sets the text to be displayed by self when no accelerator is set.
  
      Params:
        disabledText = the text to be displayed when no accelerator is set
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setDisabledText(string disabledText) nothrow
  {
    const(char)* _disabledText = disabledText.toCString!(No.Malloc, No.Nullable);
    gtk_shortcut_label_set_disabled_text(cast(GtkShortcutLabel*)this._cPtr, _disabledText);
  }
}

/// Fluent builder implementation template for [gid.gtk4.shortcut_label.ShortcutLabel]
class ShortcutLabelGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `accelerator` property.
      Params:
        propval = The accelerator that @self displays.
          
          See [gid.gtk4.shortcuts_shortcut.ShortcutsShortcut.accelerator]
          for the accepted syntax.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T accelerator(string propval) nothrow
  {
    return setProperty("accelerator", propval);
  }

  /**
      Set `disabledText` property.
      Params:
        propval = The text that is displayed when no accelerator is set.
      Returns: Builder instance for fluent chaining
  
      Deprecated: This widget will be removed in GTK 5
  */
  T disabledText(string propval) nothrow
  {
    return setProperty("disabled-text", propval);
  }
}

/// Fluent builder for [gid.gtk4.shortcut_label.ShortcutLabel]
final class ShortcutLabelGidBuilder : ShortcutLabelGidBuilderImpl!ShortcutLabelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShortcutLabel build() nothrow
  {
    return new ShortcutLabel(cast(void*)createGObject(ShortcutLabel._getGType), Yes.Take);
  }
}
