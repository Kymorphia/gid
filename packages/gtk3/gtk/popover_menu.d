/// Module for [PopoverMenu] class
module gtk.popover_menu;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.popover;
import gtk.types;

/**
    GtkPopoverMenu is a subclass of #GtkPopover that treats its
    children like menus and allows switching between them. It is
    meant to be used primarily together with #GtkModelButton, but
    any widget can be used, such as #GtkSpinButton or #GtkScale.
    In this respect, GtkPopoverMenu is more flexible than popovers
    that are created from a #GMenuModel with [gtk.popover.Popover.newFromModel].
    
    To add a child as a submenu, set the #GtkPopoverMenu:submenu
    child property to the name of the submenu. To let the user open
    this submenu, add a #GtkModelButton whose #GtkModelButton:menu-name
    property is set to the name you've given to the submenu.
    
    By convention, the first child of a submenu should be a #GtkModelButton
    to switch back to the parent menu. Such a button should use the
    #GtkModelButton:inverted and #GtkModelButton:centered properties
    to achieve a title-like appearance and place the submenu indicator
    at the opposite side. To switch back to the main menu, use "main"
    as the menu name.
    
    # Example
    
    ```xml
    <object class="GtkPopoverMenu">
      <child>
        <object class="GtkBox">
          <property name="visible">True</property>
          <property name="margin">10</property>
          <child>
            <object class="GtkModelButton">
              <property name="visible">True</property>
              <property name="action-name">win.frob</property>
              <property name="text" translatable="yes">Frob</property>
            </object>
          </child>
          <child>
            <object class="GtkModelButton">
              <property name="visible">True</property>
              <property name="menu-name">more</property>
              <property name="text" translatable="yes">More</property>
            </object>
          </child>
        </object>
      </child>
      <child>
        <object class="GtkBox">
          <property name="visible">True</property>
          <property name="margin">10</property>
          <child>
            <object class="GtkModelButton">
              <property name="visible">True</property>
              <property name="action-name">win.foo</property>
              <property name="text" translatable="yes">Foo</property>
            </object>
          </child>
          <child>
            <object class="GtkModelButton">
              <property name="visible">True</property>
              <property name="action-name">win.bar</property>
              <property name="text" translatable="yes">Bar</property>
            </object>
          </child>
        </object>
        <packing>
          <property name="submenu">more</property>
        </packing>
      </child>
    </object>
    ```
    
    Just like normal popovers created using gtk_popover_new_from_model,
    #GtkPopoverMenu instances have a single css node called "popover"
    and get the .menu style class.
*/
class PopoverMenu : gtk.popover.Popover
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
    return cast(void function())gtk_popover_menu_get_type != &gidSymbolNotFound ? gtk_popover_menu_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PopoverMenu self()
  {
    return this;
  }

  /**
      Get builder for [gtk.popover_menu.PopoverMenu]
      Returns: New builder object
  */
  static PopoverMenuGidBuilder builder()
  {
    return new PopoverMenuGidBuilder;
  }

  /** */
  @property string visibleSubmenu()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("visible-submenu");
  }

  /** */
  @property void visibleSubmenu(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("visible-submenu", propval);
  }

  /**
      Creates a new popover menu.
      Returns: a new #GtkPopoverMenu
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_menu_new();
    this(_cretval, No.Take);
  }

  /**
      Opens a submenu of the popover. The name
      must be one of the names given to the submenus
      of popover with #GtkPopoverMenu:submenu, or
      "main" to switch back to the main menu.
      
      #GtkModelButton will open submenus automatically
      when the #GtkModelButton:menu-name property is set,
      so this function is only needed when you are using
      other kinds of widgets to initiate menu changes.
  
      Params:
        name = the name of the menu to switch to
  */
  void openSubmenu(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_popover_menu_open_submenu(cast(GtkPopoverMenu*)this._cPtr, _name);
  }
}

/// Fluent builder implementation template for [gtk.popover_menu.PopoverMenu]
class PopoverMenuGidBuilderImpl(T) : gtk.popover.PopoverGidBuilderImpl!T
{


  /** */
  T visibleSubmenu(string propval)
  {
    return setProperty("visible-submenu", propval);
  }
}

/// Fluent builder for [gtk.popover_menu.PopoverMenu]
final class PopoverMenuGidBuilder : PopoverMenuGidBuilderImpl!PopoverMenuGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PopoverMenu build()
  {
    return new PopoverMenu(cast(void*)createGObject(PopoverMenu._getGType), No.Take);
  }
}
