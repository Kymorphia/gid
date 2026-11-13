/// Module for [ShortcutLabel] class
module adw.shortcut_label;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A widget that displays a keyboard shortcut.
    
    <picture>
      <source srcset="shortcut-label-dark.png" media="(prefers-color-scheme: dark)">
      <img src="shortcut-label.png" alt="shortcut-label">
    </picture>
    
    The shown shortcut can be set using the [adw.shortcut_label.ShortcutLabel.accelerator]
    property.
    
    Optionally, if no shortcut is set, [adw.shortcut_label.ShortcutLabel] will display a
    placeholder set with the [adw.shortcut_label.ShortcutLabel.disabledText] property.
    
    The following types of shortcuts can be displayed:
    
    - A single shortcut in `func@Gtk.accelerator_parse` format, e.g. `<Control>C`:
    
        <picture>
          <source srcset="shortcut-label-single-dark.png" media="(prefers-color-scheme: dark)">
          <img src="shortcut-label-single.png" alt="shortcut-label-single">
        </picture>
    
    - Multiple alternative shortcuts, separated with spaces, e.g. `<Shift>A Home`:
    
        <picture>
          <source srcset="shortcut-label-alternative-dark.png" media="(prefers-color-scheme: dark)">
          <img src="shortcut-label-alternative.png" alt="shortcut-label-alternative">
        </picture>
    
    - A range of shortcuts, separated with `...`, e.g. `<Alt>1...9`:
    
        <picture>
          <source srcset="shortcut-label-range-dark.png" media="(prefers-color-scheme: dark)">
          <img src="shortcut-label-range.png" alt="shortcut-label-range">
        </picture>
    
    - Multiple keys pressed at once, separated with `&`, e.g. `Control_L&Control_R`:
    
        <picture>
          <source srcset="shortcut-label-multiple-dark.png" media="(prefers-color-scheme: dark)">
          <img src="shortcut-label-multiple.png" alt="shortcut-label-multiple">
        </picture>
    
    - Multiple shortcuts or keys, pressed sequentially, separated with `+`, e.g. `<Control>C+<Control>X`:
    
        <picture>
          <source srcset="shortcut-label-sequence-dark.png" media="(prefers-color-scheme: dark)">
          <img src="shortcut-label-sequence.png" alt="shortcut-label-sequence">
        </picture>
    
    ::: note
        `<`, `>` and `&` need to be escaped as `&lt;`, `&gt;` and `&amp;` when used in UI files.
    
    ## CSS nodes
    
    [adw.shortcut_label.ShortcutLabel] has a single CSS node with name `shortcut-label`. The
    individual keycap labels each have the `.keycap` style class, while the
    labels separating them have the `.dimmed` style class.
    
    ## Accessibility
    
    [adw.shortcut_label.ShortcutLabel] uses the [gtk.types.AccessibleRole.Label] role.
    
    See also: [adw.shortcuts_dialog.ShortcutsDialog].
*/
class ShortcutLabel : gtk.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_shortcut_label_get_type != &gidSymbolNotFound ? adw_shortcut_label_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwShortcutLabel";
  }

  /** Returns `this`, for use in `with` statements. */
  override ShortcutLabel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.shortcut_label.ShortcutLabel]
      Returns: New builder object
  */
  static ShortcutLabelGidBuilder builder() nothrow
  {
    return new ShortcutLabelGidBuilder;
  }

  /**
      Get `accelerator` property.
      Returns: The displayed accelerator.
  */
  @property string accelerator() nothrow
  {
    return getAccelerator();
  }

  /**
      Set `accelerator` property.
      Params:
        propval = The displayed accelerator.
  */
  @property void accelerator(string propval) nothrow
  {
    setAccelerator(propval);
  }

  /**
      Get `disabledText` property.
      Returns: The text displayed when no accelerator is set.
  */
  @property string disabledText() nothrow
  {
    return getDisabledText();
  }

  /**
      Set `disabledText` property.
      Params:
        propval = The text displayed when no accelerator is set.
  */
  @property void disabledText(string propval) nothrow
  {
    setDisabledText(propval);
  }

  /**
      Creates a new [adw.shortcut_label.ShortcutLabel] showing accelerator.
  
      Params:
        accelerator = the accelerator to show
      Returns: the newly created [adw.shortcut_label.ShortcutLabel]
  */
  this(string accelerator) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _accelerator = accelerator.toCString!(No.Malloc, No.Nullable);
    _cretval = adw_shortcut_label_new(_accelerator);
    this(_cretval, No.Take);
  }

  /**
      Gets the accelerator displayed by self.
      Returns: the displayed accelerator
  */
  string getAccelerator() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_shortcut_label_get_accelerator(cast(AdwShortcutLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the text displayed by self when no accelerator is set.
      Returns: the text displayed when no accelerator is set
  */
  string getDisabledText() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_shortcut_label_get_disabled_text(cast(AdwShortcutLabel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets the accelerator to be displayed by self.
  
      Params:
        accelerator = the accelerator to be displayed
  */
  void setAccelerator(string accelerator) nothrow
  {
    const(char)* _accelerator = accelerator.toCString!(No.Malloc, No.Nullable);
    adw_shortcut_label_set_accelerator(cast(AdwShortcutLabel*)this._cPtr, _accelerator);
  }

  /**
      Sets the text to be displayed by self when no accelerator is set.
  
      Params:
        disabledText = the text displayed when no accelerator is set
  */
  void setDisabledText(string disabledText) nothrow
  {
    const(char)* _disabledText = disabledText.toCString!(No.Malloc, No.Nullable);
    adw_shortcut_label_set_disabled_text(cast(AdwShortcutLabel*)this._cPtr, _disabledText);
  }
}

/// Fluent builder implementation template for [adw.shortcut_label.ShortcutLabel]
class ShortcutLabelGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `accelerator` property.
      Params:
        propval = The displayed accelerator.
      Returns: Builder instance for fluent chaining
  */
  T accelerator(string propval) nothrow
  {
    return setProperty("accelerator", propval);
  }

  /**
      Set `disabledText` property.
      Params:
        propval = The text displayed when no accelerator is set.
      Returns: Builder instance for fluent chaining
  */
  T disabledText(string propval) nothrow
  {
    return setProperty("disabled-text", propval);
  }
}

/// Fluent builder for [adw.shortcut_label.ShortcutLabel]
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
