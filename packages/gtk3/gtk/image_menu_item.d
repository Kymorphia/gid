/// Module for [ImageMenuItem] class
module gtk.image_menu_item;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.accel_group;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu_item;
import gtk.types;
import gtk.widget;

/**
    A GtkImageMenuItem is a menu item which has an icon next to the text label.
    
    This is functionally equivalent to:
    
    ```c
      GtkWidget *box = gtk_box_new (GTK_ORIENTATION_HORIZONTAL, 6);
      GtkWidget *icon = gtk_image_new_from_icon_name ("folder-music-symbolic", GTK_ICON_SIZE_MENU);
      GtkWidget *label = gtk_label_new ("Music");
      GtkWidget *menu_item = gtk_menu_item_new ();
    
      gtk_container_add (GTK_CONTAINER (box), icon);
      gtk_container_add (GTK_CONTAINER (box), label);
    
      gtk_container_add (GTK_CONTAINER (menu_item), box);
    
      gtk_widget_show_all (menu_item);
    ```
    
    Note that the user may disable display of menu icons using
    the #GtkSettings:gtk-menu-images setting, so make sure to still
    fill in the text label. If you want to ensure that your menu items
    show an icon you are strongly encouraged to use a #GtkMenuItem
    with a #GtkImage instead.
    
    #GtkImageMenuItem has been deprecated since GTK+ 3.10. If you want to
    display an icon in a menu item, you should use #GtkMenuItem and pack a
    #GtkBox with a #GtkImage and a #GtkLabel instead. You should also consider
    using #GtkBuilder and the XML #GMenu description for creating menus, by
    following the [GMenu guide][https://developer.gnome.org/GMenu/]. You should
    consider using icons in menu items only sparingly, and for "objects" (or
    "nouns") elements only, like bookmarks, files, and links; "actions" (or
    "verbs") should not have icons.
    
    Furthermore, if you would like to display keyboard accelerator, you must
    pack the accel label into the box using [gtk.box.Box.packEnd] and align the
    label, otherwise the accelerator will not display correctly. The following
    code snippet adds a keyboard accelerator to the menu item, with a key
    binding of Ctrl+M:
    
    ```c
      GtkWidget *box = gtk_box_new (GTK_ORIENTATION_HORIZONTAL, 6);
      GtkWidget *icon = gtk_image_new_from_icon_name ("folder-music-symbolic", GTK_ICON_SIZE_MENU);
      GtkWidget *label = gtk_accel_label_new ("Music");
      GtkWidget *menu_item = gtk_menu_item_new ();
      GtkAccelGroup *accel_group = gtk_accel_group_new ();
    
      gtk_container_add (GTK_CONTAINER (box), icon);
    
      gtk_label_set_use_underline (GTK_LABEL (label), TRUE);
      gtk_label_set_xalign (GTK_LABEL (label), 0.0);
    
      gtk_widget_add_accelerator (menu_item, "activate", accel_group,
                                  GDK_KEY_m, GDK_CONTROL_MASK, GTK_ACCEL_VISIBLE);
      gtk_accel_label_set_accel_widget (GTK_ACCEL_LABEL (label), menu_item);
    
      gtk_box_pack_end (GTK_BOX (box), label, TRUE, TRUE, 0);
    
      gtk_container_add (GTK_CONTAINER (menu_item), box);
    
      gtk_widget_show_all (menu_item);
    ```
*/
class ImageMenuItem : gtk.menu_item.MenuItem
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
    return cast(void function())gtk_image_menu_item_get_type != &gidSymbolNotFound ? gtk_image_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ImageMenuItem self()
  {
    return this;
  }

  /**
      Set `accelGroup` property.
      Params:
        propval = The Accel Group to use for stock accelerator keys
  
      Deprecated: Use [gtk.widget.Widget.addAccelerator] instead
  */
  @property void accelGroup(gtk.accel_group.AccelGroup propval)
  {
    return setAccelGroup(propval);
  }

  /**
      Get `alwaysShowImage` property.
      Returns: If true, the menu item will always show the image, if available.
        
        Use this property only if the menuitem would be useless or hard to use
        without the image.
  
      Deprecated: Use a #GtkMenuItem containing a #GtkBox with
          a #GtkAccelLabel and a #GtkImage instead
  */
  @property bool alwaysShowImage()
  {
    return getAlwaysShowImage();
  }

  /**
      Set `alwaysShowImage` property.
      Params:
        propval = If true, the menu item will always show the image, if available.
          
          Use this property only if the menuitem would be useless or hard to use
          without the image.
  
      Deprecated: Use a #GtkMenuItem containing a #GtkBox with
          a #GtkAccelLabel and a #GtkImage instead
  */
  @property void alwaysShowImage(bool propval)
  {
    return setAlwaysShowImage(propval);
  }

  /**
      Get `image` property.
      Returns: Child widget to appear next to the menu text.
  
      Deprecated: Use a #GtkMenuItem containing a #GtkBox with
          a #GtkAccelLabel and a #GtkImage instead
  */
  @property gtk.widget.Widget image()
  {
    return getImage();
  }

  /**
      Set `image` property.
      Params:
        propval = Child widget to appear next to the menu text.
  
      Deprecated: Use a #GtkMenuItem containing a #GtkBox with
          a #GtkAccelLabel and a #GtkImage instead
  */
  @property void image(gtk.widget.Widget propval)
  {
    return setImage(propval);
  }

  /**
      Get `useStock` property.
      Returns: If true, the label set in the menuitem is used as a
        stock id to select the stock item for the item.
  
      Deprecated: Use a named icon from the #GtkIconTheme instead
  */
  @property bool useStock()
  {
    return getUseStock();
  }

  /**
      Set `useStock` property.
      Params:
        propval = If true, the label set in the menuitem is used as a
          stock id to select the stock item for the item.
  
      Deprecated: Use a named icon from the #GtkIconTheme instead
  */
  @property void useStock(bool propval)
  {
    return setUseStock(propval);
  }

  /**
      Creates a new #GtkImageMenuItem with an empty label.
      Returns: a new #GtkImageMenuItem
  
      Deprecated: Use [gtk.menu_item.MenuItem.new_] instead.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_menu_item_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkImageMenuItem containing the image and text from a
      stock item. Some stock ids have preprocessor macros like #GTK_STOCK_OK
      and #GTK_STOCK_APPLY.
      
      If you want this menu item to have changeable accelerators, then pass in
      null for accel_group. Next call [gtk.menu_item.MenuItem.setAccelPath] with an
      appropriate path for the menu item, use [gtk.global.stockLookup] to look up the
      standard accelerator for the stock item, and if one is found, call
      [gtk.accel_map.AccelMap.addEntry] to register it.
  
      Params:
        stockId = the name of the stock item.
        accelGroup = the #GtkAccelGroup to add the menu items
            accelerator to, or null.
      Returns: a new #GtkImageMenuItem.
  
      Deprecated: Use [gtk.menu_item.MenuItem.newWithMnemonic] instead.
  */
  static gtk.image_menu_item.ImageMenuItem newFromStock(string stockId, gtk.accel_group.AccelGroup accelGroup = null)
  {
    GtkWidget* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_image_menu_item_new_from_stock(_stockId, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.image_menu_item.ImageMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkImageMenuItem containing a label.
  
      Params:
        label = the text of the menu item.
      Returns: a new #GtkImageMenuItem.
  
      Deprecated: Use [gtk.menu_item.MenuItem.newWithLabel] instead.
  */
  static gtk.image_menu_item.ImageMenuItem newWithLabel(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_image_menu_item_new_with_label(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.image_menu_item.ImageMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkImageMenuItem containing a label. The label
      will be created using [gtk.label.Label.newWithMnemonic], so underscores
      in label indicate the mnemonic for the menu item.
  
      Params:
        label = the text of the menu item, with an underscore in front of the
                  mnemonic character
      Returns: a new #GtkImageMenuItem
  
      Deprecated: Use [gtk.menu_item.MenuItem.newWithMnemonic] instead.
  */
  static gtk.image_menu_item.ImageMenuItem newWithMnemonic(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_image_menu_item_new_with_mnemonic(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.image_menu_item.ImageMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the menu item will ignore the #GtkSettings:gtk-menu-images
      setting and always show the image, if available.
      Returns: true if the menu item will always show the image
  */
  bool getAlwaysShowImage()
  {
    bool _retval;
    _retval = cast(bool)gtk_image_menu_item_get_always_show_image(cast(GtkImageMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets the widget that is currently set as the image of image_menu_item.
      See [gtk.image_menu_item.ImageMenuItem.setImage].
      Returns: the widget set as image of image_menu_item
  */
  gtk.widget.Widget getImage()
  {
    GtkWidget* _cretval;
    _cretval = gtk_image_menu_item_get_image(cast(GtkImageMenuItem*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether the label set in the menuitem is used as a
      stock id to select the stock item for the item.
      Returns: true if the label set in the menuitem is used as a
            stock id to select the stock item for the item
  */
  bool getUseStock()
  {
    bool _retval;
    _retval = cast(bool)gtk_image_menu_item_get_use_stock(cast(GtkImageMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Specifies an accel_group to add the menu items accelerator to
      (this only applies to stock items so a stock item must already
      be set, make sure to call [gtk.image_menu_item.ImageMenuItem.setUseStock]
      and [gtk.menu_item.MenuItem.setLabel] with a valid stock item first).
      
      If you want this menu item to have changeable accelerators then
      you shouldnt need this (see [gtk.image_menu_item.ImageMenuItem.newFromStock]).
  
      Params:
        accelGroup = the #GtkAccelGroup
  */
  void setAccelGroup(gtk.accel_group.AccelGroup accelGroup)
  {
    gtk_image_menu_item_set_accel_group(cast(GtkImageMenuItem*)this._cPtr, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null);
  }

  /**
      If true, the menu item will ignore the #GtkSettings:gtk-menu-images
      setting and always show the image, if available.
      
      Use this property if the menuitem would be useless or hard to use
      without the image.
  
      Params:
        alwaysShow = true if the menuitem should always show the image
  */
  void setAlwaysShowImage(bool alwaysShow)
  {
    gtk_image_menu_item_set_always_show_image(cast(GtkImageMenuItem*)this._cPtr, alwaysShow);
  }

  /**
      Sets the image of image_menu_item to the given widget.
      Note that it depends on the show-menu-images setting whether
      the image will be displayed or not.
  
      Params:
        image = a widget to set as the image for the menu item.
  */
  void setImage(gtk.widget.Widget image = null)
  {
    gtk_image_menu_item_set_image(cast(GtkImageMenuItem*)this._cPtr, image ? cast(GtkWidget*)image._cPtr(No.Dup) : null);
  }

  /**
      If true, the label set in the menuitem is used as a
      stock id to select the stock item for the item.
  
      Params:
        useStock = true if the menuitem should use a stock item
  */
  void setUseStock(bool useStock)
  {
    gtk_image_menu_item_set_use_stock(cast(GtkImageMenuItem*)this._cPtr, useStock);
  }
}
