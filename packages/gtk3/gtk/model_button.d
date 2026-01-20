/// Module for [ModelButton] class
module gtk.model_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.icon;
import gobject.object;
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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_model_button_get_type != &gidSymbolNotFound ? gtk_model_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ModelButton self()
  {
    return this;
  }

  /**
      Get `active` property.
      Returns: The state of the button. This is reflecting the state of the associated
        #GAction.
  */
  @property bool active()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("active");
  }

  /**
      Set `active` property.
      Params:
        propval = The state of the button. This is reflecting the state of the associated
          #GAction.
  */
  @property void active(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("active", propval);
  }

  /**
      Get `centered` property.
      Returns: Whether to render the button contents centered instead of left-aligned.
        This property should be set for title-like items.
  */
  @property bool centered()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("centered");
  }

  /**
      Set `centered` property.
      Params:
        propval = Whether to render the button contents centered instead of left-aligned.
          This property should be set for title-like items.
  */
  @property void centered(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("centered", propval);
  }

  /**
      Get `icon` property.
      Returns: A #GIcon that will be used if iconic appearance for the button is
        desired.
  */
  @property gio.icon.Icon icon()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.icon.Icon)("icon");
  }

  /**
      Set `icon` property.
      Params:
        propval = A #GIcon that will be used if iconic appearance for the button is
          desired.
  */
  @property void icon(gio.icon.Icon propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.icon.Icon)("icon", propval);
  }

  /**
      Get `iconic` property.
      Returns: If this property is set, the button will show an icon if one is set.
        If no icon is set, the text will be used. This is typically used for
        horizontal sections of linked buttons.
  */
  @property bool iconic()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("iconic");
  }

  /**
      Set `iconic` property.
      Params:
        propval = If this property is set, the button will show an icon if one is set.
          If no icon is set, the text will be used. This is typically used for
          horizontal sections of linked buttons.
  */
  @property void iconic(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("iconic", propval);
  }

  /**
      Get `inverted` property.
      Returns: Whether to show the submenu indicator at the opposite side than normal.
        This property should be set for model buttons that 'go back' to a parent
        menu.
  */
  @property bool inverted()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("inverted");
  }

  /**
      Set `inverted` property.
      Params:
        propval = Whether to show the submenu indicator at the opposite side than normal.
          This property should be set for model buttons that 'go back' to a parent
          menu.
  */
  @property void inverted(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("inverted", propval);
  }

  /**
      Get `menuName` property.
      Returns: The name of a submenu to open when the button is activated.
        If this is set, the button should not have an action associated with it.
  */
  @property string menuName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("menu-name");
  }

  /**
      Set `menuName` property.
      Params:
        propval = The name of a submenu to open when the button is activated.
          If this is set, the button should not have an action associated with it.
  */
  @property void menuName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("menu-name", propval);
  }

  /**
      Get `role` property.
      Returns: Specifies whether the button is a plain, check or radio button.
        When #GtkActionable:action-name is set, the role will be determined
        from the action and does not have to be set explicitly.
  */
  @property gtk.types.ButtonRole role()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.ButtonRole)("role");
  }

  /**
      Set `role` property.
      Params:
        propval = Specifies whether the button is a plain, check or radio button.
          When #GtkActionable:action-name is set, the role will be determined
          from the action and does not have to be set explicitly.
  */
  @property void role(gtk.types.ButtonRole propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.ButtonRole)("role", propval);
  }

  /**
      Get `text` property.
      Returns: The label for the button.
  */
  @property string text()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text");
  }

  /**
      Set `text` property.
      Params:
        propval = The label for the button.
  */
  @property void text(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Get `useMarkup` property.
      Returns: If true, XML tags in the text of the button are interpreted as by
        [pango.global.parseMarkup] to format the enclosed spans of text. If false, the
        text will be displayed verbatim.
  */
  @property bool useMarkup()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-markup");
  }

  /**
      Set `useMarkup` property.
      Params:
        propval = If true, XML tags in the text of the button are interpreted as by
          [pango.global.parseMarkup] to format the enclosed spans of text. If false, the
          text will be displayed verbatim.
  */
  @property void useMarkup(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-markup", propval);
  }

  /**
      Creates a new GtkModelButton.
      Returns: the newly created #GtkModelButton widget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_model_button_new();
    this(_cretval, No.Take);
  }
}
