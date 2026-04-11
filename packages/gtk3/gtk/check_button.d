/// Module for [CheckButton] class
module gtk.check_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.toggle_button;
import gtk.types;

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
    
    A GtkCheckButton with indicator (see [gtk.toggle_button.ToggleButton.setMode]) has a
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
class CheckButton : gtk.toggle_button.ToggleButton
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
    return cast(void function())gtk_check_button_get_type != &gidSymbolNotFound ? gtk_check_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CheckButton self()
  {
    return this;
  }

  /**
      Get builder for [gtk.check_button.CheckButton]
      Returns: New builder object
  */
  static CheckButtonGidBuilder builder()
  {
    return new CheckButtonGidBuilder;
  }

  /**
      Creates a new #GtkCheckButton.
      Returns: a #GtkWidget.
  */
  this()
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
  static gtk.check_button.CheckButton newWithLabel(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_check_button_new_with_label(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.check_button.CheckButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkCheckButton containing a label. The label
      will be created using [gtk.label.Label.newWithMnemonic], so underscores
      in label indicate the mnemonic for the check button.
  
      Params:
        label = The text of the button, with an underscore in front of the
            mnemonic character
      Returns: a new #GtkCheckButton
  */
  static gtk.check_button.CheckButton newWithMnemonic(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_check_button_new_with_mnemonic(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.check_button.CheckButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.check_button.CheckButton]
class CheckButtonGidBuilderImpl(T) : gtk.toggle_button.ToggleButtonGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.check_button.CheckButton]
final class CheckButtonGidBuilder : CheckButtonGidBuilderImpl!CheckButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CheckButton build()
  {
    return new CheckButton(cast(void*)createGObject(CheckButton._getGType), No.Take);
  }
}
