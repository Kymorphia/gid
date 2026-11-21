/// Module for [ShortcutLabel] class
module gid.gtk3.shortcut_label;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.box;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;

/**
    #GtkShortcutLabel is a widget that represents a single keyboard shortcut or gesture
    in the user interface.
*/
class ShortcutLabel : gid.gtk3.box.Box
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
      Get builder for [gid.gtk3.shortcut_label.ShortcutLabel]
      Returns: New builder object
  */
  static ShortcutLabelGidBuilder builder() nothrow
  {
    return new ShortcutLabelGidBuilder;
  }

  /**
      Get `accelerator` property.
      Returns: The accelerator that @self displays. See #GtkShortcutsShortcut:accelerator
        for the accepted syntax.
  */
  @property string accelerator() nothrow
  {
    return getAccelerator();
  }

  /**
      Set `accelerator` property.
      Params:
        propval = The accelerator that @self displays. See #GtkShortcutsShortcut:accelerator
          for the accepted syntax.
  */
  @property void accelerator(string propval) nothrow
  {
    setAccelerator(propval);
  }

  /**
      Get `disabledText` property.
      Returns: The text that is displayed when no accelerator is set.
  */
  @property string disabledText() nothrow
  {
    return getDisabledText();
  }

  /**
      Set `disabledText` property.
      Params:
        propval = The text that is displayed when no accelerator is set.
  */
  @property void disabledText(string propval) nothrow
  {
    setDisabledText(propval);
  }

  /**
      Creates a new #GtkShortcutLabel with accelerator set.
  
      Params:
        accelerator = the initial accelerator
      Returns: a newly-allocated #GtkShortcutLabel
  */
  this(string accelerator) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _accelerator = accelerator.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_shortcut_label_new(_accelerator);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the current accelerator of self.
      Returns: the current accelerator.
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
  */
  void setDisabledText(string disabledText) nothrow
  {
    const(char)* _disabledText = disabledText.toCString!(No.Malloc, No.Nullable);
    gtk_shortcut_label_set_disabled_text(cast(GtkShortcutLabel*)this._cPtr, _disabledText);
  }
}

/// Fluent builder implementation template for [gid.gtk3.shortcut_label.ShortcutLabel]
class ShortcutLabelGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T
{


  /**
      Set `accelerator` property.
      Params:
        propval = The accelerator that @self displays. See #GtkShortcutsShortcut:accelerator
          for the accepted syntax.
      Returns: Builder instance for fluent chaining
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
  */
  T disabledText(string propval) nothrow
  {
    return setProperty("disabled-text", propval);
  }
}

/// Fluent builder for [gid.gtk3.shortcut_label.ShortcutLabel]
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
