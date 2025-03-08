module gtk.model_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    GtkModelButton is a button class that can use a #GAction as its model.
  In contrast to #GtkToggleButton or #GtkRadioButton, which can also
  be backed by a #GAction via the #GtkActionable:action-name property,
  GtkModelButton will adapt its appearance according to the kind of
  action it is backed by, and appear either as a plain, check or
  radio button.
  
  Model buttons are used when popovers from a menu model with
  [gtk.popover.Popover.newFromModel]; they can also be used manually in
  a #GtkPopoverMenu.
  
  When the action is specified via the #GtkActionable:action-name
  and #GtkActionable:action-target properties, the role of the button
  (i.e. whether it is a plain, check or radio button) is determined by
  the type of the action and doesn't have to be explicitly specified
  with the #GtkModelButton:role property.
  
  The content of the button is specified by the #GtkModelButton:text
  and #GtkModelButton:icon properties.
  
  The appearance of model buttons can be influenced with the
  #GtkModelButton:centered and #GtkModelButton:iconic properties.
  
  Model buttons have built-in support for submenus in #GtkPopoverMenu.
  To make a GtkModelButton that opens a submenu when activated, set
  the #GtkModelButton:menu-name property. To make a button that goes
  back to the parent menu, you should set the #GtkModelButton:inverted
  property to place the submenu indicator at the opposite side.
  
  # Example
  
  ```
  <object class="GtkPopoverMenu">
    <child>
      <object class="GtkBox">
        <property name="visible">True</property>
        <property name="margin">10</property>
        <child>
          <object class="GtkModelButton">
            <property name="visible">True</property>
            <property name="action-name">view.cut</property>
            <property name="text" translatable="yes">Cut</property>
          </object>
        </child>
        <child>
          <object class="GtkModelButton">
            <property name="visible">True</property>
            <property name="action-name">view.copy</property>
            <property name="text" translatable="yes">Copy</property>
          </object>
        </child>
        <child>
          <object class="GtkModelButton">
            <property name="visible">True</property>
            <property name="action-name">view.paste</property>
            <property name="text" translatable="yes">Paste</property>
          </object>
        </child>
      </object>
    </child>
  </object>
  ```
  
  # CSS nodes
  
  ```plain
  modelbutton
  ├── <child>
  ╰── check
  ```
  
  ```plain
  modelbutton
  ├── <child>
  ╰── radio
  ```
  
  ```plain
  modelbutton
  ├── <child>
  ╰── arrow
  ```
  
  GtkModelButton has a main CSS node with name modelbutton, and a subnode,
  which will have the name check, radio or arrow, depending on the role
  of the button and whether it has a menu name set.
  
  The subnode is positioned before or after the content nodes and gets the
  .left or .right style class, depending on where it is located.
  
  ```plain
  button.model
  ├── <child>
  ╰── check
  ```
  
  Iconic model buttons (see #GtkModelButton:iconic) change the name of
  their main node to button and add a .model style class to it. The indicator
  subnode is invisible in this case.
*/
class ModelButton : gtk.button.Button
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_model_button_get_type != &gidSymbolNotFound ? gtk_model_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new GtkModelButton.
    Returns:     the newly created #GtkModelButton widget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_model_button_new();
    this(_cretval, No.take);
  }
}
