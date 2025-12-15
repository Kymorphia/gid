/// Module for [RecentChooserMenu] class
module gtk.recent_chooser_menu;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu;
import gtk.recent_chooser;
import gtk.recent_chooser_mixin;
import gtk.recent_manager;
import gtk.types;

/**
    #GtkRecentChooserMenu is a widget suitable for displaying recently used files
    inside a menu.  It can be used to set a sub-menu of a #GtkMenuItem using
    [gtk.menu_item.MenuItem.setSubmenu], or as the menu of a #GtkMenuToolButton.
    
    Note that #GtkRecentChooserMenu does not have any methods of its own. Instead,
    you should use the functions that work on a #GtkRecentChooser.
    
    Note also that #GtkRecentChooserMenu does not support multiple filters, as it
    has no way to let the user choose between them as the #GtkRecentChooserWidget
    and #GtkRecentChooserDialog widgets do. Thus using [gtk.recent_chooser.RecentChooser.addFilter]
    on a #GtkRecentChooserMenu widget will yield the same effects as using
    [gtk.recent_chooser.RecentChooser.setFilter], replacing any currently set filter
    with the supplied filter; [gtk.recent_chooser.RecentChooser.removeFilter] will remove
    any currently set #GtkRecentFilter object and will unset the current filter;
    [gtk.recent_chooser.RecentChooser.listFilters] will return a list containing a single
    #GtkRecentFilter object.
    
    Recently used files are supported since GTK+ 2.10.
*/
class RecentChooserMenu : gtk.menu.Menu, gtk.activatable.Activatable, gtk.recent_chooser.RecentChooser
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
    return cast(void function())gtk_recent_chooser_menu_get_type != &gidSymbolNotFound ? gtk_recent_chooser_menu_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecentChooserMenu self()
  {
    return this;
  }

  /**
      Get `showNumbers` property.
      Returns: Whether the first ten items in the menu should be prepended by
      a number acting as a unique mnemonic.
  */
  @property bool showNumbers()
  {
    return getShowNumbers();
  }

  /**
      Set `showNumbers` property.
      Params:
        propval = Whether the first ten items in the menu should be prepended by
        a number acting as a unique mnemonic.
  */
  @property void showNumbers(bool propval)
  {
    return setShowNumbers(propval);
  }

  mixin ActivatableT!();
  mixin RecentChooserT!();

  /**
      Creates a new #GtkRecentChooserMenu widget.
      
      This kind of widget shows the list of recently used resources as
      a menu, each item as a menu item.  Each item inside the menu might
      have an icon, representing its MIME type, and a number, for mnemonic
      access.
      
      This widget implements the #GtkRecentChooser interface.
      
      This widget creates its own #GtkRecentManager object.  See the
      [gtk.recent_chooser_menu.RecentChooserMenu.newForManager] function to know how to create
      a #GtkRecentChooserMenu widget bound to another #GtkRecentManager object.
      Returns: a new #GtkRecentChooserMenu
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_recent_chooser_menu_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkRecentChooserMenu widget using manager as
      the underlying recently used resources manager.
      
      This is useful if you have implemented your own recent manager,
      or if you have a customized instance of a #GtkRecentManager
      object or if you wish to share a common #GtkRecentManager object
      among multiple #GtkRecentChooser widgets.
  
      Params:
        manager = a #GtkRecentManager
      Returns: a new #GtkRecentChooserMenu, bound to manager.
  */
  static gtk.recent_chooser_menu.RecentChooserMenu newForManager(gtk.recent_manager.RecentManager manager)
  {
    GtkWidget* _cretval;
    _cretval = gtk_recent_chooser_menu_new_for_manager(manager ? cast(GtkRecentManager*)manager._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.recent_chooser_menu.RecentChooserMenu)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the value set by [gtk.recent_chooser_menu.RecentChooserMenu.setShowNumbers].
      Returns: true if numbers should be shown.
  */
  bool getShowNumbers()
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_chooser_menu_get_show_numbers(cast(GtkRecentChooserMenu*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether a number should be added to the items of menu.  The
      numbers are shown to provide a unique character for a mnemonic to
      be used inside ten menu item’s label.  Only the first the items
      get a number to avoid clashes.
  
      Params:
        showNumbers = whether to show numbers
  */
  void setShowNumbers(bool showNumbers)
  {
    gtk_recent_chooser_menu_set_show_numbers(cast(GtkRecentChooserMenu*)this._cPtr, showNumbers);
  }
}
