/// Module for [ShortcutLabel] class
module gtk.shortcut_label;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    #GtkShortcutLabel is a widget that represents a single keyboard shortcut or gesture
    in the user interface.
*/
class ShortcutLabel : gtk.box.Box
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
    return cast(void function())gtk_shortcut_label_get_type != &gidSymbolNotFound ? gtk_shortcut_label_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutLabel self()
  {
    return this;
  }

  /**
      Get `accelerator` property.
      Returns: The accelerator that @self displays. See #GtkShortcutsShortcut:accelerator
        for the accepted syntax.
  */
  @property string accelerator()
  {
    return getAccelerator();
  }

  /**
      Set `accelerator` property.
      Params:
        propval = The accelerator that @self displays. See #GtkShortcutsShortcut:accelerator
          for the accepted syntax.
  */
  @property void accelerator(string propval)
  {
    return setAccelerator(propval);
  }

  /**
      Get `disabledText` property.
      Returns: The text that is displayed when no accelerator is set.
  */
  @property string disabledText()
  {
    return getDisabledText();
  }

  /**
      Set `disabledText` property.
      Params:
        propval = The text that is displayed when no accelerator is set.
  */
  @property void disabledText(string propval)
  {
    return setDisabledText(propval);
  }

  /**
      Creates a new #GtkShortcutLabel with accelerator set.
  
      Params:
        accelerator = the initial accelerator
      Returns: a newly-allocated #GtkShortcutLabel
  */
  this(string accelerator)
  {
    GtkWidget* _cretval;
    const(char)* _accelerator = accelerator.toCString(No.Alloc);
    _cretval = gtk_shortcut_label_new(_accelerator);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the current accelerator of self.
      Returns: the current accelerator.
  */
  string getAccelerator()
  {
    const(char)* _cretval;
    _cretval = gtk_shortcut_label_get_accelerator(cast(GtkShortcutLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the text that is displayed when no accelerator is set.
      Returns: the current text displayed when no
        accelerator is set.
  */
  string getDisabledText()
  {
    const(char)* _cretval;
    _cretval = gtk_shortcut_label_get_disabled_text(cast(GtkShortcutLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the accelerator to be displayed by self.
  
      Params:
        accelerator = the new accelerator
  */
  void setAccelerator(string accelerator)
  {
    const(char)* _accelerator = accelerator.toCString(No.Alloc);
    gtk_shortcut_label_set_accelerator(cast(GtkShortcutLabel*)this._cPtr, _accelerator);
  }

  /**
      Sets the text to be displayed by self when no accelerator is set.
  
      Params:
        disabledText = the text to be displayed when no accelerator is set
  */
  void setDisabledText(string disabledText)
  {
    const(char)* _disabledText = disabledText.toCString(No.Alloc);
    gtk_shortcut_label_set_disabled_text(cast(GtkShortcutLabel*)this._cPtr, _disabledText);
  }
}
