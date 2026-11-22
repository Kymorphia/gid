/// Module for [CheckButton] class
module gid.gtk3.check_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.toggle_button;
import gid.gtk3.types;

/**
    A #GtkCheckButton places a discrete #GtkToggleButton next to a widget,
    (usually a #GtkLabel). See the section on #GtkToggleButton widgets for
    more information about toggle/check buttons.
    
    The important signal ( #GtkToggleButton::toggled ) is also inherited from
    #GtkToggleButton.
    
    # CSS nodes
    
    ```plain
    checkbutton
    ├── check
    ╰── <child>
    ```
    
    A GtkCheckButton with indicator (see [gid.gtk3.toggle_button.ToggleButton.setMode]) has a
    main CSS node with name checkbutton and a subnode with name check.
    
    ```plain
    button.check
    ├── check
    ╰── <child>
    ```
    
    A GtkCheckButton without indicator changes the name of its main node
    to button and adds a .check style class to it. The subnode is invisible
    in this case.
*/
class CheckButton : gid.gtk3.toggle_button.ToggleButton
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
    return cast(void function())gtk_check_button_get_type != &gidSymbolNotFound ? gtk_check_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCheckButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override CheckButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.check_button.CheckButton]
      Returns: New builder object
  */
  static CheckButtonGidBuilder builder() nothrow
  {
    return new CheckButtonGidBuilder;
  }

  /**
      Creates a new #GtkCheckButton.
      Returns: a #GtkWidget.
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_check_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkCheckButton with a #GtkLabel to the right of it.
  
      Params:
        label = the text for the check button.
      Returns: a #GtkWidget.
  */
  static gid.gtk3.check_button.CheckButton newWithLabel(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_check_button_new_with_label(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.check_button.CheckButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkCheckButton containing a label. The label
      will be created using [gid.gtk4.label.Label.newWithMnemonic], so underscores
      in label indicate the mnemonic for the check button.
  
      Params:
        label = The text of the button, with an underscore in front of the
            mnemonic character
      Returns: a new #GtkCheckButton
  */
  static gid.gtk3.check_button.CheckButton newWithMnemonic(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_check_button_new_with_mnemonic(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.check_button.CheckButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk3.check_button.CheckButton]
class CheckButtonGidBuilderImpl(T) : gid.gtk3.toggle_button.ToggleButtonGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.check_button.CheckButton]
final class CheckButtonGidBuilder : CheckButtonGidBuilderImpl!CheckButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CheckButton build() nothrow
  {
    return new CheckButton(cast(void*)createGObject(CheckButton._getGType), Yes.Take);
  }
}
